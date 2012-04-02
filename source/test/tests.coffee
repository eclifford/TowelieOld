
if typeof define isnt "function"
  module = require("./config")
else
  module = define

module ["cs!test/spec/lib/akqa.core", 
        "cs!test/spec/plugins/jquery.plugin",
        "cs!test/spec/models/contact"], () ->

  # Do tests...