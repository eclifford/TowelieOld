# Contact Sub View
#
# @todo Provide more examples
#
# @example How to create a ContactView
#   view = new ContactView
#
# @author Eric Clifford
#
define [
 "cs!fascade"], 
 (Fascade) ->

  # # This is a description of the view
  # ContactView = Backbone.View.extend(
  #   tagName: "article"
  #   className: "contact-container"
  #   template: _.template(template)
  #   editTemplate: _.template(contactEditTemplate)

  #   initialize: ->

  #   # Render the View
  #   render: ->
  #     @$el.html @template(@model.toJSON())
  #     this

  #   # A list of all event's to listen to and their actions
  #   events:
  #     "click button.delete": "deleteContact"
  #     "click button.edit": "editContact"
  #     "change select.type": "addType"
  #     "click button.save": "saveEdits"
  #     "click button.cancel": "cancelEdit"

  #   # Deletes a contact and removes it from the view
  #   deleteContact: ->
  #     removedType = @model.get("type").toLowerCase()
  #     @model.destroy()
  #     @remove()
  #     directory.$el.find("#filter select").children("[value='" + removedType + "']").remove()  if _.indexOf(directory.getTypes(), removedType) is -1

  #   # Enables the editable view 
  #   editContact: ->
  #     @$el.html @editTemplate(@model.toJSON())
  #     newOpt = $("<option/>",
  #       html: "<em>Add new...</em>"
  #       value: "addType"
  #     )
  #     @select = directory.createSelect().addClass("type").val(@$el.find("#type").val()).append(newOpt).insertAfter(@$el.find(".name"))
  #     @$el.find("input[type='hidden']").remove()

  #   # Adds the input type
  #   addType: ->
  #     if @select.val() is "addType"
  #       @select.remove()
  #       $("<input />",
  #         class: "type"
  #       ).insertAfter(@$el.find(".name")).focus()

  #   # Saves any edits to storage
  #   saveEdits: (e) ->
  #     e.preventDefault()
  #     formData = {}
  #     prev = @model.previousAttributes()
  #     $(e.target).closest("form").find(":input").not("button").each ->
  #       el = $(this)
  #       formData[el.attr("class")] = el.val()

  #     delete formData.photo  if formData.photo is ""
  #     @model.set formData
  #     @render()
  #     delete prev.photo  if prev.photo is "/img/placeholder.png"
  #     _.each contacts, (contact) ->
  #       contacts.splice _.indexOf(contacts, contact), 1, formData  if _.isEqual(contact, prev)

  #   # Cancel an edit
  #   cancelEdit: ->
  #     @render()
  # )