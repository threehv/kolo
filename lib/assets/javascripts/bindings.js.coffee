ko.bindingHandlers.appearif = 
  init: (element, valueAccessor)->
    value = ko.utils.unwrapObservable valueAccessor()
    $(element).toggle(value)
  update: (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext)->
    appear = ko.utils.unwrapObservable valueAccessor()
    duration = allBindingsAccessor().duration || 400
    if appear
      $(element).fadeIn(duration)
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
