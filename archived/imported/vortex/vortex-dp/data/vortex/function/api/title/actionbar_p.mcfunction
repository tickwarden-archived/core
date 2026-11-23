# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/title/actionbar_p
# Action bar with %tokens% for @s. The text is rendered with api/store/render into a plain
# string (vortex:store out.string); the component only exists while the command runs.
# INPUT vortex:title in.text - string with %tokens%;  in.args - optional compound for %name%
# NOTE: uses vortex:store in/out while it runs.
#
# Usage:
#   data modify storage vortex:title in set value {text:"HP %health% | %player%"}
#   function vortex:api/title/actionbar_p
execute if data storage vortex:engine modules{title:0b} run return 0
data remove storage vortex:store in
data modify storage vortex:store in.template set value ""
execute if data storage vortex:title in.text run data modify storage vortex:store in.template set from storage vortex:title in.text
execute if data storage vortex:title in.args run data modify storage vortex:store in.args set from storage vortex:title in.args
execute unless function vortex:api/store/render run return 0
title @s actionbar {"storage":"vortex:store","nbt":"out.string","interpret":false,"plain":true}
