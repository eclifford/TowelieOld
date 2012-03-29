# The collection of images
#
# @author Eric Clifford
#
define ["backbone", "models/image"], (Backbone, Image) ->
  Images = Backbone.Collection.extend(
   model: Image
  )
  Images