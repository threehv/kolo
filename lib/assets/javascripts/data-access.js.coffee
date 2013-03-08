class ViewModel
  constructor: ->
    @loading = ko.observable false
    @errorMessage = ko.observable ''
    @errorMessage.subscribe (newValue)=>
      if (newValue? && newValue != '')
        setTimeout =>
          @errorMessage('')
        , 10000
      return true

  systemNotification: (name, value)->
    $('body').attr("data-#{name}", value)
    @loading(/ing$/.test(value))

class ClientViewModel extends ViewModel

class AdminViewModel extends ViewModel

# Construct passing in a name (which is used in notifications) and a URL (eg /api/v1/people.json) that is used to load items (GET) and create them (POST)
# Subclasses are expected to implement
# newItem(id) - return an instance of a new model with the given ID (data will be filled in later by the Db)
# itemDataFrom(data) - return an array of JSON instances; for example if your people.json call returns data.people [ person1, person2 ] you would return data.people
# toJS(item) - convert the given item into a raw JS object
# urlFor(item) - the URL for updates (PUT) or deletes (DELETE)
# doUpdate - update the given item in the database; on success, call @load()
# doDelete - delete the given item from the database; on success call @items.remove(item) and then @load()
# It expects models to have an updateAttributes(data) method and a valid method

class Db
  constructor: (@name, @url)->
    @items = ko.observableArray []
    @selected = ko.observable null
    @plural = "#{@name}s"

  find: (id)=>
    for item in @items()
      return item if item.id == id
    return null

  findOrCreate: (id)=>
    item = @find(id) 
    if !item?
      item = @newItem(id)
      @items.push item
    return item

  load: (autoReload = false)=>
    if !@selected()
      viewModel.systemNotification @plural, 'loading'
      $.get @url, (data)=>
        for itemData in @itemDataFrom(data)
          item = @findOrCreate itemData.id
          item.updateAttributes itemData
        viewModel.systemNotification @plural, 'loaded'
    if autoReload
      setTimeout =>
        @load(true)
      , 10000
    return false

  add: =>
    itemToAdd = @newItem(null)
    @selected(itemToAdd)
    viewModel.systemNotification @name, 'new'

  save: (item)=>
    return unless item.valid()
    if item.id?
      @doUpdate item
    else
      @doCreate item

  doCreate: (item)=>
    viewModel.systemNotification @name, 'saving'
    $.ajax
      url: @url
      dataType: 'json'
      type: 'POST'
      data: @toJS(item) 
      success: (data)=>
        @selected null
        viewModel.systemNotification @name, 'saved'
        @load()
    return false

  doUpdate: (item)=>
    viewModel.systemNotification @name, 'saving'
    $.ajax
      url: @urlFor(item)
      dataType: 'json'
      type: 'PUT'
      data: @toJS(item)
      success: (data)=>
        @selected null
        viewModel.systemNotification @name, 'saved'
        @load()
    return false

  doDestroy: (item)=>
    viewModel.systemNotification @name, 'deleting'
    $.ajax
      url: @urlFor(item)
      dataType: 'json'
      type: 'DELETE'
      success: (data)=>
        viewModel.systemNotification @name, 'deleted'
        @selected null
        @items.remove(item)
        @load()
    return false

  newItem: (id)=>
    null

  itemDataFrom: (data)=>
    null

  toJS: (item)=>
    null

  urlFor: (item)=>
    null

  doDelete: (client)=>
    null


window.ViewModel = ViewModel
window.ClientViewModel = ClientViewModel
window.AdminViewModel = AdminViewModel
window.Db = Db

window.viewModel = new ViewModel # this will probably be overridden by other pages later on