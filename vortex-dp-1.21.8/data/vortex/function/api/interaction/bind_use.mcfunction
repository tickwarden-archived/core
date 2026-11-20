# vortex:api/interaction/bind_use
# Binds a function to an interaction entity use (right-click) event.
#
# INPUT:
#   vortex:input tag  — entity tag to match
#   vortex:input func — function to call on use
#
# USAGE:
#   data modify storage vortex:input tag set value "my_interact"
#   data modify storage vortex:input func set value "mypack:on_use"
#   function vortex:api/interaction/bind_use with storage vortex:input {}
execute if data storage vortex:engine modules{interaction:0b} run return 0
function vortex:core/internal/api/interaction/bind_use_do with storage vortex:input {}
