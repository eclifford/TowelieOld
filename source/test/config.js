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
    cs:           "javascripts/lib/requirejs/plugins/cs",
    order:        "javascripts/lib/requirejs/plugins/order",
    text:         "javascripts/lib/requirejs/plugins/text",
    requirejs:    "javascripts/lib/requirejs/require",
    backbone:     "javascripts/lib/backbone/backbone",
    underscore:   "javascripts/lib/underscore/underscore",
    app:          "javascripts/",
    templates:    "javascripts/templates",
    core:         "javascripts/lib/akqa/akqa.core",
    logger:       "javascripts/modules/logger",
    contact:      "javascripts/views/contact",
    fascade:      "javascripts/lib/akqa/akqa.fascade",
    permissions:  "javascripts/lib/akqa/akqa.permissions"
  }
};

nodeConfig = {
  nodeRequire: require
};

browserConfig = {
  baseUrl: "..",
  paths: {
    use:          "javascripts/lib/requirejs/plugins/use",
    backbone:     "javascripts/lib/backbone/backbone",
    jquery:       "javascripts/lib/jquery/jquery-1.7.2",
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