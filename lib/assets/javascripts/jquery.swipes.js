(function($) {
  var methods = {
    disappearToTheLeft: function() {
      this.transition({
        x: '-5000px'
      }, 500);
      this.hide();
      return this;
    },
    disappearToTheRight: function() {
      this.transition({
        x: '5000px'
      }, 500);
      this.hide();
      return this;
    },
    disappearUpwards: function() { 
      this.transition({
        y: '-5000px'
      }, 500);
      this.hide();
      return this;
    },
    disappearDownwards: function() { 
      this.transition({
        y: '10000px'
      }, 500);
      this.hide();
      return this;
    },
    reappearFromTheRight: function() {
      this.transition({
        x: '5000px'
      }, 0);
      this.show();
      this.transition({
        x: '0px'
      }, 100);
      return this;
    },
    reappearFromTheLeft: function() {
      this.transition({
        x: '-5000px'
      }, 0);
      this.show();
      this.transition({
        x: '0px'
      }, 100);
      return this;
    }, 
    reappearFromTheBottom: function() {
      this.transition({
        y: '10000px'
      }, 0);
      this.show();
      this.transition({
        y: '0px'
      }, 100);
      return this;
    },
    reappearFromTheTop: function() {
      this.transition({
        y: '-10000px'
      }, 0);
      this.show();
      this.transition({
        y: '0px'
      }, 100);
      return this;
    }
  };

  $.fn.swipes = function(method) {
    if (methods[method]) {
      return methods[method].apply(this, Array.prototype.slice.call( arguments, 1 ));
    } else if (typeof method === 'object' || !method) {
      return methods.init.apply(this, arguments);
    } else {
      $.error( 'Method ' +  method + ' does not exist on jQuery.swipes' );
    }
  };

})(jQuery);
