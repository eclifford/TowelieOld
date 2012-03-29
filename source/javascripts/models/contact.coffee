# A Contact Model
#
# @author Eric Clifford
#
define ["underscore", "backbone", "./../views/contact"], (_, Backbone)->
  Contact = Backbone.Model.extend(

    ###
    # Set the model defaults
    ###
    defaults:
      photo: "/images/placeholder.png"
      name: ""
      address: ""
      tel: ""
      email: ""
      type: ""

    ###
    # Verify the validity of model
    ###
    validate: (attrs) ->
      if attrs.photo is ""
        "photo cannot be empty"
  )
  Contact
