requirejs = require("requirejs")
requirejs.config
  nodeRequire: require
  baseUrl: "."
  paths:
    cs: "source/javascripts/lib/requirejs/plugins/cs"
    text: "source/javascripts/lib/requirejs/plugins/text"
    requirejs: "source/javascripts/lib/requirejs/require"
    backbone: "source/javascripts/lib/backbone/backbone"
    underscore: "source/javascripts/lib/underscore/underscore"
    app: "source/javascripts/"
    templates: "source/javascripts/templates"

# Ensure document is defined for backbone.
global.document = require("jsdom").jsdom()