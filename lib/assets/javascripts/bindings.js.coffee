ko.bindingHandlers.appearif = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).toggle(value)
  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 400
    if appear
      $(element).fadeIn(duration)
      $(element).focus()
    else
      $(element).fadeOut(duration)

ko.bindingHandlers.appearifnot = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).toggle(!value)
  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 400
    if !appear
      $(element).fadeIn(duration)
      $(element).focus()
    else
      $(element).fadeOut(duration)

ko.bindingHandlers.slidedownif = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).toggle(value)
  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 1000
    if appear
      $(element).slideDown(duration)
      $(element).focus()
    else
      $(element).slideUp(duration)

ko.bindingHandlers.slidedownifnot = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).toggle(!value)
  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 1000
    if !appear
      $(element).slideDown(duration)
      $(element).focus()
    else
      $(element).slideUp(duration)

ko.bindingHandlers.slideleftif = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    if !value
      $(element).hide()
      $(element).transition({ x: '10000px' }, 1)
    else
      $(element).show()
      $(element).focus()

  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 1000
    if appear
      $(element).show()
      $(element).transition({ x: 0 }, duration)
    else
      $(element).transition({ x: '10000px' }, duration, ->
        $(element).hide()
      )

ko.bindingHandlers.slideleftifnot = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    if value
      $(element).hide()
      $(element).transition({ x: '10000px' }, 1)
    else
      $(element).show()
      $(element).focus()

  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 1000
    if !appear
      $(element).show()
      $(element).transition({ x: 0 }, duration)
    else
      $(element).transition({ x: '10000px' }, duration, ->
        $(element).hide()
      )

ko.bindingHandlers.sliderightif = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    if !value
      $(element).hide()
      $(element).transition({ x: '-10000px' }, 1)
    else
      $(element).show()
      $(element).focus()

  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 1000
    if appear
      $(element).show()
      $(element).transition({ x: 0 }, duration)
    else
      $(element).transition({ x: '-10000px' }, duration, ->
        $(element).hide()
      )

ko.bindingHandlers.sliderightifnot = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    if value
      $(element).hide()
      $(element).transition({ x: '-10000px' }, 1)
    else
      $(element).show()
      $(element).focus()

  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 1000
    if !appear
      $(element).show()
      $(element).transition({ x: 0 }, duration)
    else
      $(element).transition({ x: '-10000px' }, duration, ->
        $(element).hide()
      )

ko.bindingHandlers.swipeleft = 
  init: (element, valueAccessor)->
    Hammer(element).on 'swipeleft', (event)-> 
      value = valueAccessor()
      value(event)

ko.bindingHandlers.swiperight = 
  init: (element, valueAccessor)->
    Hammer(element).on 'swiperight', (event)-> 
      value = valueAccessor()
      value(event)

ko.bindingHandlers.swipeup = 
  init: (element, valueAccessor)->
    Hammer(element).on 'swipeup', (event)-> 
      value = valueAccessor()
      value(event)

ko.bindingHandlers.swipedown = 
  init: (element, valueAccessor)->
    Hammer(element).on 'swipedown', (event)-> 
      value = valueAccessor()
      value(event)

ko.bindingHandlers.fileupload = 
  init: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    options = ko.utils.unwrapObservable valueAccessor()
    property = ko.utils.unwrapObservable options.property
    parameter = ko.utils.unwrapObservable options.parameter
    onStartUpload = ko.utils.unwrapObservable options.onStartUpload
    onComplete = ko.utils.unwrapObservable options.onComplete
    url = ko.utils.unwrapObservable options.url

    return false unless (property && url && parameter)

    uploadFile = (file)=>
      viewModel[onStartUpload]() if viewModel[onStartUpload]?
      formData = new FormData
      formData.append parameter, file
      xhr = new XMLHttpRequest
      if xhr.addEventListener?
        xhr.addEventListener 'load', (event)->
          viewModel[onComplete]() if viewModel[onComplete]?
      else
        xhr.attachEvent 'load', (event)->
          viewModel[onComplete]() if viewModel[onComplete]?
      xhr.open 'POST', url
      xhr.send formData

    element.addEventListener = element.attachEvent unless element.addEventListener?

    element.addEventListener 'drop', (event)=>
      event.stopPropagation()
      event.preventDefault()
      files = event.dataTransfer.files
      return unless files.length > 0
      uploadFile files[0]

    element.addEventListener 'change', (event)=>
      event.stopPropagation()
      event.preventDefault()
      file = event.target.files[0]
      uploadFile file

    return true

ko.bindingHandlers.wysiwyg = 
  init: (element, valueAccessor, allBindingsAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).attr('id', "ckeditor-#{Math.floor((Math.random() * 100000) + 10000)}") unless $(element).attr('id')?
    editor = CKEDITOR.replace(element)
    document.recalc() if document.recalc?

    editor.on 'change', (evt)->
      $(element).attr 'data-edit-in-progress', 'true'
      observable = valueAccessor()
      observable(evt.editor.getData())
      $(element).attr 'data-edit-in-progress', 'false'

  update: (element, valueAccessor)->
    return if $(element).attr('data-edit-in-progress') == 'true'
    id = $(element).attr('id')
    value = ko.utils.unwrapObservable valueAccessor()
    CKEDITOR.instances[id].setData value
    ko.bindingHandlers.value.update element, valueAccessor
    $(element).attr('data-edit-in-progress', 'false')

ko.bindingHandlers.date = 
  init: (element, valueAccessor, allBindingsAccessor)->
    options = allBindingsAccessor().datepickerOptions || {}
    options.dateFormat ||= 'yy-mm-dd'

    $(element).datepicker(options)
    $(element).on 'change', (evt)->
      observable = valueAccessor()
      observable $(element).datepicker('getDate')

    ko.utils.domNodeDisposal.addDisposeCallback element, ->
      $(element).datepicker('destroy')

  update: (element, valueAccessor)->
    value = ko.utils.unwrapObservable(valueAccessor())
    parsed = $.datepicker.parseDate 'yy-mm-dd', value
    $(element).datepicker('setDate', parsed)

ko.bindingHandlers.richtext =
  init: (element, valueAccessor, allBindingsAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).wysihtml5
	    'events':
	      'blur': ->
	        $(element).attr 'data-edit-in-progress', 'true'
	        observable = valueAccessor()
	        newValue = $(element).val()
	        observable newValue
	        $(element).attr 'data-edit-in-progress', ''
	        
    ko.utils.domNodeDisposal.addDisposeCallback element, =>
      $(element).wysihtml5('destroy')

  update: (element, valueAccessor)->
    return if $(element).attr('data-edit-in-progress') == 'true'
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).data('wysihtml5').editor.setValue value
    ko.bindingHandlers.value.update element, valueAccessor

