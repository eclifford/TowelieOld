unless window?
  requirejs = require("requirejs")
  requirejs.config
    nodeRequire: require
    baseUrl: "."
    paths:
      cs: "source/javascripts/lib/requirejs/plugins/cs"
      order: "source/javascripts/lib/requirejs/plugins/order"
      text: "source/javascripts/lib/requirejs/plugins/text"
      requirejs: "source/javascripts/lib/requirejs/require"
      backbone: "source/javascripts/lib/backbone/backbone"
      underscore: "source/javascripts/lib/underscore/underscore"
      app: "source/javascripts/"
      templates: "source/javascripts/templates"
      core: "source/javascripts/lib/akqa/akqa.core"
      logger: "source/javascripts/modules/logger"
      contact: "source/javascripts/views/contact"
      fascade: "source/javascripts/lib/akqa/akqa.fascade"
      permissions: "source/javascripts/lib/akqa/akqa.permissions"

  window = global
  # Ensure document is defined for backbone.
  window.document = require("jsdom").jsdom()

  module.exports = requirejs
