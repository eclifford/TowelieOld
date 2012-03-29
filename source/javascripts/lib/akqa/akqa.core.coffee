((root, factory) ->
  if typeof exports is "object"
    module.exports = factory(require("../../modules/logger"))
  else if typeof define is "function" and define.amd
    define ["cs!logger"], factory
  else
    root.returnExports = factory(root.b)
) this, (Logger) ->

  modules = {}
  channels = {}

  # Subscribe a listener
  # @param [string] the channel to listen 
  # @param [object] the subscriber
  #
  subscribe: (channel, callback) ->  
    channels[channel] = []unless channels[channel]
    channels[channel].push callback

  #
  #
  #
  unsubscribe: (channel, callback) ->
    channels[channel] = null

  #
  #
  #
  unsubscribeAll: (channel, subscription) ->
    channels = null

  # Publish event to channel
  # @param [string] the channel to publish event
  #
  publish: (channel) ->
    return  unless channels[channel]
    args = [].slice.call(arguments, 1)
    i = 0
    l = channels[channel].length

    while i < l
      channels[channel][i].apply this, args
      i++

  # Create a module
  # @moduleId the AMD module to load
  #
  create: (moduleId, callback) ->
    if typeof moduleId is "string"
      require [moduleId], (module) ->
        # Verify we have a valid module we can start/stop
        if module.init and typeof module.init is "function" and module.destroy and typeof module.destroy is "function"
          modules[moduleId] = module
          Logger.log 1, "Module " + moduleId + " Create: Succeeded"
          callback()
        else
          Logger.log 3, "Module " + moduleId + " Create: FAILED: instance has no init or destroy methods"
    else 
      Logger.log 1, "Module" 

  # Start a module
  # @moduleId the AMD module to start
  #
  start: (moduleId) ->
    mod = modules[moduleId]
    if(mod) 
      mod.init()
      Logger.log 1, "Module " + moduleId + " Start: Succeeded"
    else
      Logger.log 3, "Module " + moduleId + " Start: FAILED: no instance"

  #
  #
  #
  startAll: ->
    for id of modules
      modules[id].init()
      Logger.log 1, "Module " + id + " Start: Succeeded"

  #
  #
  #
  stopAll: ->
    for id of modules
      modules[id].destroy()
      Logger.log 1, "Module " + id + " Stop: Succeeded"

  #
  #
  #
  stop: (moduleId) ->
    mod = modules[moduleId]

    if(mod) 
      mod.destroy()
      Logger.log 1, "Module " + moduleId + " Stop: Succeeded"
    else 
      Logger.log 3, "Module " + moduleId + " Stop: FAILED: instance doesn't exist"


# # AKQA is the mediator for all module communication. 
# #
# # @author Eric Clifford
# #
# define ['logger'], (Logger) ->
#   modules = {}
#   channels = {}

#   #
#   #
#   #
#   requirejs.onError = (err) ->
#     if err.requireType is "timeout"
#       console.warn "Could not load module " + err.requireModules
#     else
#       throw err

#   # Subscribe a listener
#   # @param [string] the channel to listen 
#   # @param [object] the subscriber
#   #
#   subscribe: (channel, callback) ->  
#     channels[channel] = []unless channels[channel]
#     channels[channel].push callback

#   #
#   #
#   #
#   unsubscribe: (channel, callback) ->
#     channels[channel] = null

#   #
#   #
#   #
#   unsubscribeAll: (channel, subscription) ->
#     channels = null

#   # Publish event to channel
#   # @param [string] the channel to publish event
#   #
#   publish: (channel) ->
#     return  unless channels[channel]
#     args = [].slice.call(arguments, 1)
#     i = 0
#     l = channels[channel].length

#     while i < l
#       channels[channel][i].apply this, args
#       i++

#   # Create a module
#   # @moduleId the AMD module to load
#   #
#   create: (moduleId, callback) ->
#     if typeof moduleId is "string"
#       require [moduleId], (module) ->
#         # Verify we have a valid module we can start/stop
#         if module.init and typeof module.init is "function" and module.destroy and typeof module.destroy is "function"
#           modules[moduleId] = module
#           Logger.log 1, "Module " + moduleId + " Create: Succeeded"
#           callback()
#         else
#           Logger.log 3, "Module " + moduleId + " Create: FAILED: instance has no init or destroy methods"
#     else 
#       Logger.log 1, "Module" 

#   # Start a module
#   # @moduleId the AMD module to start
#   #
#   start: (moduleId) ->
#     mod = modules[moduleId]
#     if(mod) 
#       mod.init()
#       Logger.log 1, "Module " + moduleId + " Start: Succeeded"
#     else
#       Logger.log 3, "Module " + moduleId + " Start: FAILED: no instance"

#   #
#   #
#   #
#   startAll: ->
#     for id of modules
#       modules[id].init()
#       Logger.log 1, "Module " + id + " Start: Succeeded"

#   #
#   #
#   #
#   stopAll: ->
#     for id of modules
#       modules[id].destroy()
#       Logger.log 1, "Module " + id + " Stop: Succeeded"

#   #
#   #
#   #
#   stop: (moduleId) ->
#     mod = modules[moduleId]

#     if(mod) 
#       mod.destroy()
#       Logger.log 1, "Module " + moduleId + " Stop: Succeeded"
#     else 
#       Logger.log 3, "Module " + moduleId + " Stop: FAILED: instance doesn't exist"

