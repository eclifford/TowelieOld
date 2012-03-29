# AKQA Fascade
#
# @author Eric Clifford
#
define ["cs!core", "cs!permissions" ], (core, permissions) ->
  facade = facade or {}
  facade.subscribe = (subscriber, channel, callback) ->
    core.subscribe channel, callback  if permissions.validate(subscriber, channel)

  facade.unsubscribe = (channel, subscription) ->
    core.unsubscribe channel, subscription

  facade.unsubscribeAll = (channel) ->
    core.unsubscribeAll channel

  facade.publish = (channel, data) ->
    core.publish channel, data

  facade.create = (module, callback) ->
    core.create module, callback

  facade.start = (module) ->
    core.start module

  facade.stop = (module) ->
    core.stop module

  facade.startAll = ->
    core.startAll()

  facade.stopAll = ->
    core.stopAll()

  facade