# AKQA Permissions
#
# @author Eric Clifford
#
define [], ->
  permissions = {}
  permissions.validate = (subscriber, channel) ->
    true

  permissions