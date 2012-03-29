((factory) ->
  if typeof define is "function" and define.amd
    define [ "jquery" ], factory
  else
    factory(jQuery, window)
) ($, window = global) ->
  window.PluginObjectName = class PluginObjectName
    constructor: () ->

    init: (options, elem) ->
      self = @
      self.elem = elem
      self.$elem = $(elem)

      self.options = $.extend {}, $.fn.pluginName.defaults, options

  $.fn.pluginName = (options) ->
    @each ->
      pluginObjectName = new PluginObjectName()
      pluginObjectName.init options, this

  $.fn.pluginName.defaults = 
    some: "options"
    also: "others"