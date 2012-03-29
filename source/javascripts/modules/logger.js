(function() {

  define([], function() {
    var debug;
    debug = true;
    return {
      debug: function(on_) {
        return debug = (on_ ? true : false);
      },
      log: function(severity, message) {
        if (debug) {
          return console[(severity === 1 ? "log" : (severity === 2 ? "warn" : "error"))](message);
        } else {

        }
      }
    };
  });

}).call(this);
