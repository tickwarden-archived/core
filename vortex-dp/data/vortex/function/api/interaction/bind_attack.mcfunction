# vortex:api/interaction/bind_attack
# Binds a function to an interaction entity attack event.
#
# INPUT:
#   vortex:input tag  — entity tag to match
#   vortex:input func — function to call on attack
#
# USAGE:
#   data modify storage vortex:input tag set value "my_interact"
#   data modify storage vortex:input func set value "mypack:on_attack"
#   function vortex:api/interaction/bind_attack with storage vortex:input {}
execute if data storage vortex:engine modules{interaction:0b} run return 0
function vortex:core/internal/api/interaction/bind_attack_do with storage vortex:input {}
