
if typeof define isnt "function"
  requirejs = require("requirejs")
  require "./config"
  module = requirejs
else
  module = define


module ["cs!test/spec/lib/akqa.core","cs!test/spec/plugins/jquery.plugin"], () ->
  # Do tests...