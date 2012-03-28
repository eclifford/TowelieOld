# Image Sub View
#
# @author Eric Clifford
#
define [
 "fascade",
 "underscore", 
 "backbone", 
 "jquery", 
 "text!templates/image.html"], 
 (Fascade, _, Backbone, $, imageTemplate) ->

  # This is a description of the view
  ContactView = Backbone.View.extend(
    tagName: "article"
    className: "image"
    template: _.template(imageTemplate)

    # A list of all event's to listen to and their actions
    events:
      "hover img": "activate"
      "click img": "fullsize"

    initialize: ->

    # Render the View
    render: ->
      Fascade.publish "logEvent",
        message: @model.id + "rendered"
      @$el.html @template(@model.toJSON())
      this

    activate: ->
      @$el.toggleClass 'active'

      Fascade.publish "logEvent",
        message: @model.id + "highighted"

      Fascade.publish "populateDetailPanel"
        data: @model

    fullsize: ->
      Fascade.publish "logEvent",
        message: @model.id + "clicked"

      Fascade.publish "showFullsizeImage"
        image: @model
  )