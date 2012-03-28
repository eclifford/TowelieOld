# ControlPanel View
#
# @author Eric Clifford
#
define [
 "fascade",
 "underscore", 
 "backbone", 
 "jquery", 
 "text!templates/controlPanel.html"], 
 (Fascade, _, Backbone, $, controlPanelTemplate) ->

  # This is a description of the view
  OverlayView = Backbone.View.extend(
    el: $("#controlPanel")
    template: _.template(controlPanelTemplate)

    # A list of all event's to listen to and their actions
    events:
      "click input#btnStartDetailpanel": "startDetailPanel"
      "click input#btnStopDetailPane": "stopDetailPanel"
      "click input#btnStartLogPanel": "startLogPanel"
      "click input#btnStopLogPanel": "stopLogPanel"
      "click input#btnStartAll": "startAll"
      "click input#btnStopAll": "stopAll"

    initialize: ->
      @render()

    # Render the View
    render: ->
      @$el.html @template()
      @$el.show()
      this

    startDetailPanel: ->
      Fascade.create('views/detailPanel', ->
        Fascade.start('views/detailPanel')
      )

    stopDetailPanel: ->
      Fascade.stop('views/detailPanel')

    startLogPanel: ->
      Fascade.create('views/logPanel', ->
        Fascade.start('views/logPanel')
      )

    stopLogPanel: ->
      Fascade.stop('views/logPanel')

    startAll: ->
      Fascade.startAll()

    stopAll: ->
      Fascade.stopAll()

    init: ->

    destroy: ->
  )
  new OverlayView()