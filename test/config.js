var baseConfig, browserConfig, extend, nodeConfig, requirejs,
  __slice = Array.prototype.slice,
  __hasProp = Object.prototype.hasOwnProperty;

extend = function() {
  var extenders, key, object, other, val, _i, _len;
  object = arguments[0], extenders = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
  if (!(object != null)) return {};
  for (_i = 0, _len = extenders.length; _i < _len; _i++) {
    other = extenders[_i];
    for (key in other) {
      if (!__hasProp.call(other, key)) continue;
      val = other[key];
      if (!(object[key] != null) || typeof val !== "object") {
        object[key] = val;
      } else {
        object[key] = extend(object[key], val);
      }
    }
  }
  return object;
};

baseConfig = {
  baseUrl: ".",
  paths: {
    cs:           "source/javascripts/lib/requirejs/plugins/cs",
    order:        "source/javascripts/lib/requirejs/plugins/order",
    text:         "source/javascripts/lib/requirejs/plugins/text",
    requirejs:    "source/javascripts/lib/requirejs/require",
    backbone:     "source/javascripts/lib/backbone/backbone",
    underscore:   "source/javascripts/lib/underscore/underscore",
    app:          "source/javascripts/",
    templates:    "source/javascripts/templates",
    core:         "source/javascripts/lib/akqa/akqa.core",
    logger:       "source/javascripts/modules/logger",
    contact:      "source/javascripts/views/contact",
    fascade:      "source/javascripts/lib/akqa/akqa.fascade",
    permissions:  "source/javascripts/lib/akqa/akqa.permissions"
  }
};

nodeConfig = {
  nodeRequire: require
};

browserConfig = {
  baseUrl: "..",
  paths: {
    use:          "source/javascripts/lib/requirejs/plugins/use",
    backbone:     "source/javascripts/lib/backbone/backbone",
    jquery:       "source/javascripts/lib/jquery/jquery-1.7.2",
    mocha:        "node_modules/mocha/mocha",
    chai:         "test/lib/chai",
    sinon:        "test/lib/sinon_shim",
    sinon_orig:   "node_modules/sinon/lib/sinon",
    sinon_spy:    "node_modules/sinon/lib/sinon/spy"
  },
  use: {
    sinon: {
      attach:     "sinon"
    },
    sinon_spy: {
      deps:       ["use!sinon"],
      attach:     "spy"
    },
    expect: {
      attach:     "expect"
    }
  }
};

if (typeof window !== "undefined" && window !== null) {
  require.config(extend(baseConfig, browserConfig));
} else {
  requirejs = require("requirejs");
  requirejs.config(extend(baseConfig, nodeConfig));
}

if (typeof module !== "undefined" && module !== null) {
  module.exports = requirejs;
}