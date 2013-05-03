class ViewModel
  constructor: ->
    @loading = ko.observable false
    @flashMessage = ko.observable ''
    @flashMessage.subscribe (newValue)=>
      if (newValue? && newValue != '')
        setTimeout =>
          @flashMessage('')
        , 10000
      return true

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
#   Plus an optional pushStateURI; if supplied (for example as /path/to/object) then the pushState is updated to selected().name() with the URI set to /path/to/object/#{selected().id}
#
# Subclasses are expected to implement
# newItem(id) - return an instance of a new model with the given ID (data will be filled in later by the Db)
# itemDataFrom(data) - return an array of JSON instances; for example if your people.json call returns data.people [ person1, person2 ] you would return data.people
# toJS(item) - convert the given item into a raw JS object
# urlFor(item) - the URL for updates (PUT) or deletes (DELETE)
# doUpdate - update the given item in the database; on success, call @load()
# doDelete - delete the given item from the database; on success call @items.remove(item) and then @load()
# name - used for setting push-state
# canLoad - you can override this to prevent the load() method from making any calls.  You should also call super when overriding as this checks for null and blank urls
#
# It expects models to have an updateAttributes(data) method and a valid method
#
# After instantiation you can also set the following hooks: 
#   db.sortFunction = function(a, b) { ... }
#   db.onBeforeLoad = function() { ... } 
#   db.onAfterLoad = function() { ... }

class Db
  constructor: (@name, url, @pushStateUri)->
    @url = ko.observable url
    @items = ko.observableArray []
    @selected = ko.observable null
    @plural = "#{@name}s"
    @sortFunction = null
    @onBeforeLoad = null
    @onAfterLoad = null
    @onAfterPost = null
    @autoLoading = false
    @url.subscribe (newValue)=>
      if newValue?
        @load(false)
    if @pushStateUri? && history.pushState?
      @selected.subscribe (newValue)=>
        if newValue? and newValue.id?
          history.pushState @selected().name(), @selected().name(), "#{@pushStateUri}/#{@selected().id}"
        else
          history.pushState '', '', @pushStateUri

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

  canLoad: =>
    return false if !@url()? || @url() == '' 
    return true

  load: (autoReload = false)=>
    return unless @canLoad()
    if !@selected()
      viewModel.systemNotification @plural, 'loading'
      viewModel.loading true
      @onBeforeLoad() if @onBeforeLoad?
      $.get @url(), (data)=>
        @doLoad(data)
        @onAfterLoad() if @onAfterLoad?
        viewModel.loading false
        viewModel.systemNotification @plural, 'loaded'
    if autoReload
      @autoLoading = true
      setTimeout =>
        @load(true)
      , 30000
    return false

  postTo: (url, data, callback)->
    viewModel.systemNotification @name, 'saving'
    viewModel.loading true
    $.ajax
      url: url
      dataType: 'json'
      type: 'POST'
      data: data
      success: (data)=>
        viewModel.systemNotification @name, 'saved'
        viewModel.loading false
        callback(data) if callback?
        @onAfterPost(data) if @onAfterPost?
        @load(false)

    return true

  add: =>
    itemToAdd = @newItem(null)
    @selected(itemToAdd)
    viewModel.systemNotification @name, 'new'
    return itemToAdd

  save: (item)=>
    return unless item.valid()
    if item.id?
      @doUpdate item
    else
      @doCreate item

  doLoad: (data)=>
    for itemData in @itemDataFrom(data)
      item = @findOrCreate itemData.id
      item.updateAttributes itemData
    if @sortFunction?
      @items.sort @sortFunction

  doCreate: (item)=>
    viewModel.systemNotification @name, 'saving'
    viewModel.loading true
    $.ajax
      url: @url()
      dataType: 'json'
      type: 'POST'
      data: @toJS(item) 
      success: (data)=>
        @selected null
        viewModel.systemNotification @name, 'saved'
        viewModel.loading false
        @load()
    return false

  doUpdate: (item)=>
    viewModel.systemNotification @name, 'saving'
    viewModel.loading true
    $.ajax
      url: @urlFor(item)
      dataType: 'json'
      type: 'PUT'
      data: @toJS(item)
      success: (data)=>
        @selected null
        viewModel.systemNotification @name, 'saved'
        viewModel.loading false
        @load()
    return false

  doDestroy: (item)=>
    viewModel.systemNotification @name, 'deleting'
    viewModel.loading true
    $.ajax
      url: @urlFor(item)
      dataType: 'json'
      type: 'DELETE'
      success: (data)=>
        viewModel.systemNotification @name, 'deleted'
        @selected null
        @items.remove(item)
        viewModel.loading false
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
