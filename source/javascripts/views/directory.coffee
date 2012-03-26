# DirectoryView
#
# @todo Provide more examples
#
# @example How to create a DirectoryView
#   view = new DirectoryView
#
# @author Eric Clifford
#
define [
  "jquery", 
  "collections/directory", 
  "views/contact"], 
  ($, Directory, ContactView) ->

    # A static list of contacts
    contacts = [
      name: "Contact 1"
      address: "1, a street, a town, a city, AB12 3CD"
      tel: "0123456789"
      email: "anemail@me.com"
      type: "family"
    ,
      name: "Eric Clifford"
      address: "425 E 11th St, Unit 9, Oakland CA"
      tel: "415-602-5405"
      email: "ericgclifford@gmail.com"
      type: "family"
    , 
      name: "Tester Testerman"
      address: "123 Main St, Mainland, CA"
      tel: "555-555-5555"
      email: "test@testerman.com"
      type: "family"
    ]

    # DirectoryView
    DirectoryView = Backbone.View.extend(
      el: $("#contacts")

      # Initialize the view
      initialize: ->
        @collection = new Directory(contacts)
        @render()
        @$el.find("#filter").append @createSelect()
        @on "change:filterType", @filterByType, this
        @collection.on "reset", @render, this
        @collection.on "add", @renderContact, this
        @collection.on "remove", @removeContact, this

      # Renders the view and subviews
      render: ->
        @$el.find("article").remove()
        _.each @collection.models, ((item) ->
          @renderContact item
        ), this

      # Render an individual contact
      # @param [object] the item to render
      #
      renderContact: (item) ->
        contactView = new ContactView(model: item)
        @$el.append contactView.render().el

      # Get the types of contact
      getTypes: ->
        _.uniq @collection.pluck("type"), false, (type) ->
          type.toLowerCase()

      # Create the select dropdown
      createSelect: ->
        filter = @$el.find("#filter")
        select = $("<select/>",
          html: "<option value='all'>All</option>"
        )
        _.each @getTypes(), (item) ->
          option = $("<option/>",
            value: item.toLowerCase()
            text: item.toLowerCase()
          ).appendTo(select)

        select

      # Events to listen and bind
      events:
        "change #filter select": "setFilter"
        "click #add": "addContact"
        "click #showForm": "showForm"

      # Set the filter
      # @param [string] the value to filter by
      #
      setFilter: (e) ->
        @filterType = e.currentTarget.value
        @trigger "change:filterType"

      # Filter the list of contacts by type
      filterByType: ->
        if @filterType is "all"
          @collection.reset contacts
          contactsRouter.navigate "filter/all"
        else
          @collection.reset contacts,
            silent: true

          filterType = @filterType
          filtered = _.filter(@collection.models, (item) ->
            item.get("type").toLowerCase() is filterType
          )
          @collection.reset filtered
          contactsRouter.navigate "filter/" + filterType

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

      # Remove contact
      removeContact: (removedModel) ->
        removed = removedModel.attributes
        delete removed.photo  if removed.photo is "/img/placeholder.png"
        _.each contacts, (contact) ->
          contacts.splice _.indexOf(contacts, contact), 1  if _.isEqual(contact, removed)

      # Show the edit form
      showForm: ->
        @$el.find("#addContact").slideToggle()
    )
    DirectoryView
 