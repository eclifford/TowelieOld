# LogPanel View
#
# @author Eric Clifford
#
define [
 "fascade",
 "underscore", 
 "backbone", 
 "jquery"], 
 (Fascade, _, Backbone, $) ->

  # This is a description of the view
  LogPanelView = Backbone.View.extend(
    el: $("#logPanel")

    initialize: ->
      _.bindAll @, 'init', 'destroy'
    
    init: ->
      Fascade.subscribe this, "logEvent", (data) =>
        @$el.prepend("> " + data.message + "<br />")
      @render()

    destroy: ->
      @$el.empty()
      @.unbind() 
      Fascade.unsubscribe('logEvent') 

  )
  new LogPanelView()
