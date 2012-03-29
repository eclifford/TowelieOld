# if typeof define isnt "function"
#   requirejs = require("requirejs")
#   require "./config"
#   module = requirejs
# else
#   module = define

require ["cs!test/spec/lib/akqa.core"], () ->
  # Do tests...