# AMD Configuration
#
# @author Eric Clifford
#
require.config
  # baseUrl:'.',
  paths:
    core: "lib/akqa/akqa.core"
    permissions: "lib/akqa/akqa.permissions"
    fascade: "lib/akqa/akqa.fascade"
    jquery: "lib/jquery/jquery-1.7.2"
    backbone: "lib/backbone/backbone"
    underscore: "lib/underscore/underscore"
    text: "lib/requirejs/plugins/text"
    detailPanel: "views/detailPanel"
    logger: "modules/akqa.logger"


# The starting point of the application
#
# @author Eric Clifford
#
require ["fascade"], (fascade) ->

  fascade.create("views/tray", ->
    fascade.start("views/tray")
  )
  fascade.create("views/overlay", ->
    fascade.start("views/overlay")
  )
  fascade.create("views/controlPanel", ->
    fascade.start("views/controlPanel")
  )

  
