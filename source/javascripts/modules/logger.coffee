# AKQA Logger
#
# @author Eric Clifford
# @version 1.0.0
((root, factory) ->
  if typeof exports is "object"
    module.exports = factory()
  else if typeof define is "function" and define.amd
    define [], factory
  else
    root.returnExports = factory(root.b)
) this, () ->
  debug = true
  
  debug: (on_) ->
    debug = (if on_ then true else false)

  log: (severity, message) ->
    if debug
      console[(if (severity is 1) then "log" else (if (severity is 2) then "warn" else "error"))] message
    else