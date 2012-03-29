# DetailPanel View
#
# @author Eric Clifford
#
define [
 "fascade",
 "text!templates/detail.html"], 
 (Fascade, detailTemplate) ->

  # This is a description of the view
  DetailView = Backbone.View.extend(
    el: $("#detailPanel")
    template: _.template(detailTemplate)

    # A list of all event's to listen to and their actions
    #events:
    #  "click img": "close"

    initialize: ->
      _.bindAll @, 'init', 'destroy'

    # Render the View
    render: ->
      @$el.html @template(@model.toJSON())
      this

    init: ->
      Fascade.subscribe this, "populateDetailPanel", (data) =>
        @model = data.data
        @render()

    destroy: ->
      @$el.empty()
      @.unbind() 
      Fascade.unsubscribe('populateDetailPanel')
  )
  new DetailView()