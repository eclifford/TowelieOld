# Tray
#
# @todo Provide more examples
#
# @author Eric Clifford
#
define [
  "jquery", 
  "collections/images", 
  "views/image",
  "data"], 
  ($, Images, ImageView, Data) ->

    # TrayView
    TrayView = Backbone.View.extend(
      el: $("#tray")

      # Events to listen and bind
      #events:

      # Initialize the view
      initialize: ->


      # Renders the view and subviews
      render: ->
        _.each @collection.models, ((item) ->
          @renderImage item
        ), this

      # Render an individual contact
      # @param [object] the item to render
      #
      renderImage: (item) ->
        imageView = new ImageView(model: item)
        @$el.append imageView.render().el

      # Add a new contact
      # @param [event] the current event
      addContact: (e) ->
        e.preventDefault()
        formData = {}
        $("#addContact").children("input").each (i, el) ->
          formData[el.id] = $(el).val()  if $(el).val() isnt ""

        contacts.push formData
        if _.indexOf(@getTypes(), formData.type) is -1
          @collection.add new Contact(formData)
          @$el.find("#filter").find("select").remove().end().append @createSelect()
        else
          @collection.add new Contact(formData)

      init: ->
        @collection = new Images(Data)
        @render()
        
      destroy: ->
        @$el.empty()
        @.unbind() 
    )
    new TrayView()
 