# AKQA is the mediator for all module communication. 
#
# @author Eric Clifford
#
define [], () ->
  channels = {}

  # Whether or not to enable debug mode
  # @param [boolean] 
  #
  debug: (on_) ->
    debug = (if on_ then true else false)

  # Subscribe a listener
  # @param [string] the channel to listen 
  # @param [object] the subscriber
  #
  subscribe: (channel, subscription) ->
    channels[channel] = []  unless channels[channel]
    channels[channel].push subscription

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

  # log: (severity, message) ->
  #   logger.log severity, message