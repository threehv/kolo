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


