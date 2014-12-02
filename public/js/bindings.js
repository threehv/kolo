// Generated by CoffeeScript 1.7.1
(function() {
  ko.bindingHandlers.appearif = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      return $(element).toggle(value);
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 400;
      if (appear) {
        $(element).fadeIn(duration);
        return $(element).focus();
      } else {
        return $(element).fadeOut(duration);
      }
    }
  };

  ko.bindingHandlers.appearifnot = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      return $(element).toggle(!value);
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 400;
      if (!appear) {
        $(element).fadeIn(duration);
        return $(element).focus();
      } else {
        return $(element).fadeOut(duration);
      }
    }
  };

  ko.bindingHandlers.slidedownif = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      return $(element).toggle(value);
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 1000;
      if (appear) {
        $(element).slideDown(duration);
        return $(element).focus();
      } else {
        return $(element).slideUp(duration);
      }
    }
  };

  ko.bindingHandlers.slidedownifnot = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      return $(element).toggle(!value);
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 1000;
      if (!appear) {
        $(element).slideDown(duration);
        return $(element).focus();
      } else {
        return $(element).slideUp(duration);
      }
    }
  };

  ko.bindingHandlers.slideleftif = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      if (!value) {
        $(element).hide();
        return $(element).transition({
          x: '10000px'
        }, 1);
      } else {
        $(element).show();
        return $(element).focus();
      }
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 1000;
      if (appear) {
        $(element).show();
        return $(element).transition({
          x: 0
        }, duration);
      } else {
        return $(element).transition({
          x: '10000px'
        }, duration, function() {
          return $(element).hide();
        });
      }
    }
  };

  ko.bindingHandlers.slideleftifnot = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      if (value) {
        $(element).hide();
        return $(element).transition({
          x: '10000px'
        }, 1);
      } else {
        $(element).show();
        return $(element).focus();
      }
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 1000;
      if (!appear) {
        $(element).show();
        return $(element).transition({
          x: 0
        }, duration);
      } else {
        return $(element).transition({
          x: '10000px'
        }, duration, function() {
          return $(element).hide();
        });
      }
    }
  };

  ko.bindingHandlers.sliderightif = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      if (!value) {
        $(element).hide();
        return $(element).transition({
          x: '-10000px'
        }, 1);
      } else {
        $(element).show();
        return $(element).focus();
      }
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 1000;
      if (appear) {
        $(element).show();
        return $(element).transition({
          x: 0
        }, duration);
      } else {
        return $(element).transition({
          x: '-10000px'
        }, duration, function() {
          return $(element).hide();
        });
      }
    }
  };

  ko.bindingHandlers.sliderightifnot = {
    init: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      if (value) {
        $(element).hide();
        return $(element).transition({
          x: '-10000px'
        }, 1);
      } else {
        $(element).show();
        return $(element).focus();
      }
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var appear, duration;
      appear = ko.utils.unwrapObservable(valueAccessor());
      duration = allBindingsAccessor().duration || 1000;
      if (!appear) {
        $(element).show();
        return $(element).transition({
          x: 0
        }, duration);
      } else {
        return $(element).transition({
          x: '-10000px'
        }, duration, function() {
          return $(element).hide();
        });
      }
    }
  };

  ko.bindingHandlers.swipeleft = {
    init: function(element, valueAccessor) {
      return Hammer(element).on('swipeleft', function(event) {
        var value;
        value = valueAccessor();
        return value(event);
      });
    }
  };

  ko.bindingHandlers.swiperight = {
    init: function(element, valueAccessor) {
      return Hammer(element).on('swiperight', function(event) {
        var value;
        value = valueAccessor();
        return value(event);
      });
    }
  };

  ko.bindingHandlers.swipeup = {
    init: function(element, valueAccessor) {
      return Hammer(element).on('swipeup', function(event) {
        var value;
        value = valueAccessor();
        return value(event);
      });
    }
  };

  ko.bindingHandlers.swipedown = {
    init: function(element, valueAccessor) {
      return Hammer(element).on('swipedown', function(event) {
        var value;
        value = valueAccessor();
        return value(event);
      });
    }
  };

  ko.bindingHandlers.fileupload = {
    init: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
      var onComplete, onStartUpload, options, parameter, property, uploadFile, url;
      options = ko.utils.unwrapObservable(valueAccessor());
      property = ko.utils.unwrapObservable(options.property);
      parameter = ko.utils.unwrapObservable(options.parameter);
      onStartUpload = ko.utils.unwrapObservable(options.onStartUpload);
      onComplete = ko.utils.unwrapObservable(options.onComplete);
      url = ko.utils.unwrapObservable(options.url);
      if (!(property && url && parameter)) {
        return false;
      }
      uploadFile = (function(_this) {
        return function(file) {
          var formData, xhr;
          if (viewModel[onStartUpload] != null) {
            viewModel[onStartUpload]();
          }
          formData = new FormData;
          formData.append(parameter, file);
          xhr = new XMLHttpRequest;
          if (xhr.addEventListener != null) {
            xhr.addEventListener('load', function(event) {
              if (viewModel[onComplete] != null) {
                return viewModel[onComplete]();
              }
            });
          } else {
            xhr.attachEvent('load', function(event) {
              if (viewModel[onComplete] != null) {
                return viewModel[onComplete]();
              }
            });
          }
          xhr.open('POST', url);
          return xhr.send(formData);
        };
      })(this);
      if (element.addEventListener == null) {
        element.addEventListener = element.attachEvent;
      }
      element.addEventListener('drop', (function(_this) {
        return function(event) {
          var files;
          event.stopPropagation();
          event.preventDefault();
          files = event.dataTransfer.files;
          if (!(files.length > 0)) {
            return;
          }
          return uploadFile(files[0]);
        };
      })(this));
      element.addEventListener('change', (function(_this) {
        return function(event) {
          var file;
          event.stopPropagation();
          event.preventDefault();
          file = event.target.files[0];
          return uploadFile(file);
        };
      })(this));
      return true;
    }
  };

  ko.bindingHandlers.wysiwyg = {
    init: function(element, valueAccessor, allBindingsAccessor) {
      var editor, value;
      value = ko.utils.unwrapObservable(valueAccessor());
      if ($(element).attr('id') == null) {
        $(element).attr('id', "ckeditor-" + (Math.floor((Math.random() * 100000) + 10000)));
      }
      editor = CKEDITOR.replace(element);
      if (document.recalc != null) {
        document.recalc();
      }
      return editor.on('change', function(evt) {
        var observable;
        $(element).attr('data-edit-in-progress', 'true');
        observable = valueAccessor();
        observable(evt.editor.getData());
        return $(element).attr('data-edit-in-progress', 'false');
      });
    },
    update: function(element, valueAccessor) {
      var id, value;
      if ($(element).attr('data-edit-in-progress') === 'true') {
        return;
      }
      id = $(element).attr('id');
      value = ko.utils.unwrapObservable(valueAccessor());
      CKEDITOR.instances[id].setData(value);
      ko.bindingHandlers.value.update(element, valueAccessor);
      return $(element).attr('data-edit-in-progress', 'false');
    }
  };

  ko.bindingHandlers.date = {
    init: function(element, valueAccessor, allBindingsAccessor) {
      var options;
      options = allBindingsAccessor().datepickerOptions || {};
      options.dateFormat || (options.dateFormat = 'yy-mm-dd');
      $(element).datepicker(options);
      $(element).on('change', function(evt) {
        var observable;
        observable = valueAccessor();
        return observable($(element).datepicker('getDate'));
      });
      return ko.utils.domNodeDisposal.addDisposeCallback(element, function() {
        return $(element).datepicker('destroy');
      });
    },
    update: function(element, valueAccessor) {
      var parsed, value;
      value = ko.utils.unwrapObservable(valueAccessor());
      if (value != null) {
        parsed = $.datepicker.parseDate('yy-mm-dd', value);
      } else {
        parsed = null;
      }
      return $(element).datepicker('setDate', parsed);
    }
  };

  ko.bindingHandlers.slider = {
    init: function(element, valueAccessor, allBindingsAccessor) {
      var options;
      options = allBindingsAccessor().sliderOptions || {};
      options.change = (function(_this) {
        return function(evt, ui) {
          var observable;
          observable = valueAccessor();
          return observable(ui.value);
        };
      })(this);
      $(element).slider(options);
      return ko.utils.domNodeDisposal.addDisposeCallback(element, function() {
        return $(element).slider('destroy');
      });
    },
    update: function(element, valueAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      if (isNaN(value)) {
        value = 0;
      }
      return $(element).slider('value', value);
    }
  };

  ko.bindingHandlers.richtext = {
    init: function(element, valueAccessor, allBindingsAccessor) {
      var value;
      value = ko.utils.unwrapObservable(valueAccessor());
      $(element).wysihtml5({
        'events': {
          'blur': function() {
            var newValue, observable;
            $(element).attr('data-edit-in-progress', 'true');
            observable = valueAccessor();
            newValue = $(element).val();
            observable(newValue);
            return $(element).attr('data-edit-in-progress', '');
          }
        }
      });
      return ko.utils.domNodeDisposal.addDisposeCallback(element, (function(_this) {
        return function() {
          return $(element).wysihtml5('destroy');
        };
      })(this));
    },
    update: function(element, valueAccessor) {
      var value;
      if ($(element).attr('data-edit-in-progress') === 'true') {
        return;
      }
      value = ko.utils.unwrapObservable(valueAccessor());
      $(element).data('wysihtml5').editor.setValue(value);
      return ko.bindingHandlers.value.update(element, valueAccessor);
    }
  };

}).call(this);
