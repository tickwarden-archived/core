# vortex:systems/sound/stop
# Stops a specific sound (and category) on a target selector.
#
# Input  (vortex:input sound):
#   target   — selector string  e.g. "@a"  "@s"
#   category — source category  (use "*" to match all categories)
#   sound    — sound event ID   (use "*" to stop all sounds in category)
#
# Usage:
#   data modify storage vortex:input sound set value \
#     {target:"@a",category:"*",sound:"*"}
#   function vortex:systems/sound/stop with storage vortex:input sound

execute if data storage vortex:engine modules{sound:0b} run return 0
$stopsound $(target) $(category) $(sound)
