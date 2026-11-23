# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/title/show_p - title + subtitle with %tokens% for @s
#
# Unlike title/show (which builds {"text":"$(title)"} and breaks on quotes or backslashes)
# this reads everything from storage, so any text is safe. Title and subtitle are rendered
# with api/store/render into PLAIN STRINGS (vortex:title t / s); the text component only
# exists while the title command runs.
#
# INPUT vortex:title in (all keys optional):
#   title     string with %tokens%   (default: empty)
#   subtitle  string with %tokens%   (default: empty)
#   args      compound for %name% tokens (see api/store/render)
#   fade_in, stay, fade_out   ticks (defaults come from config title_fade_in / title_stay / title_fade_out)
# NOTE: uses vortex:store in/out while it runs.
#
# Usage:
#   data modify storage vortex:title in set value {title:"Welcome %player%",subtitle:"Coins: %score:coins%"}
#   function vortex:api/title/show_p
#   (to address another player:  execute as Steve run function vortex:api/title/show_p)
execute if data storage vortex:engine modules{title:0b} run return 0
execute unless data storage vortex:title in.fade_in run data modify storage vortex:title in.fade_in set from storage vortex:engine config.title_fade_in
execute unless data storage vortex:title in.fade_in run data modify storage vortex:title in.fade_in set value 10
execute unless data storage vortex:title in.stay run data modify storage vortex:title in.stay set from storage vortex:engine config.title_stay
execute unless data storage vortex:title in.stay run data modify storage vortex:title in.stay set value 70
execute unless data storage vortex:title in.fade_out run data modify storage vortex:title in.fade_out set from storage vortex:engine config.title_fade_out
execute unless data storage vortex:title in.fade_out run data modify storage vortex:title in.fade_out set value 20

data remove storage vortex:store in
data modify storage vortex:store in.template set value ""
execute if data storage vortex:title in.title run data modify storage vortex:store in.template set from storage vortex:title in.title
execute if data storage vortex:title in.args run data modify storage vortex:store in.args set from storage vortex:title in.args
data modify storage vortex:title t set value ""
execute if function vortex:api/store/render run data modify storage vortex:title t set from storage vortex:store out.string

data remove storage vortex:store in
data modify storage vortex:store in.template set value ""
execute if data storage vortex:title in.subtitle run data modify storage vortex:store in.template set from storage vortex:title in.subtitle
execute if data storage vortex:title in.args run data modify storage vortex:store in.args set from storage vortex:title in.args
data modify storage vortex:title s set value ""
execute if function vortex:api/store/render run data modify storage vortex:title s set from storage vortex:store out.string

function vortex:core/internal/api/title/_apply with storage vortex:title in
