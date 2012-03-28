# Image Sub View
#
# @author Eric Clifford
#
define [
 "fascade",
 "underscore", 
 "backbone", 
 "jquery", 
 "text!templates/overlay.html"], 
 (Fascade, _, Backbone, $, overlayTemplate) ->

  # This is a description of the view
  OverlayView = Backbone.View.extend(
    el: $("#overlay")
    template: _.template(overlayTemplate)

    # A list of all event's to listen to and their actions
    events:
      "click img": "close"

    initialize: ->


    # Render the View
    render: ->
      @$el.html @template(@model.toJSON())
      @$el.show()
      this

    activate: ->
      @$el.toggleClass 'active'

    close: ->
      @$el.hide()

    init: ->
      Fascade.subscribe this, "showFullsizeImage", (data) =>
        @model = data.image
        @render()

    destroy: ->
      @$el.empty()
      @.unbind() 
      Fascade.unsubscribe "showFullsizeImage"

  )
  new OverlayView()