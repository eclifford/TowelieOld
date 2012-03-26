# AKQA Logger
#
# @author Eric Clifford
# @version 1.0.0
define [], ->
  debug = true
  debug: (on_) ->
    debug = (if on_ then true else false)

  log: (severity, message) ->
    if debug
      console[(if (severity is 1) then "log" else (if (severity is 2) then "warn" else "error"))] message
    else