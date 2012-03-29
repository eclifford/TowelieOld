define ["jquery"], ($) ->

  window = global unless window?
  jQuery = $ unless jQuery?
 
  (($) ->
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
  )(jQuery)