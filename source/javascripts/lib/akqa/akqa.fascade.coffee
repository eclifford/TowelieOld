# AKQA Fascade
#
# @author Eric Clifford
#
define [ "core", "permissions" ], (core, permissions) ->
  facade = facade or {}
  facade.subscribe = (subscriber, channel, callback) ->
    core.subscribe channel, callback  if permissions.validate(subscriber, channel)

  facade.publish = (channel) ->
    core.publish channel

  facade