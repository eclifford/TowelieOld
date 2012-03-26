# The collection of contacts
#
# @author Eric Clifford
#
define ["backbone", "models/contact"], (Backbone, Contact) ->
  Directory = Backbone.Collection.extend(
   model: Contact
  )
  Directory