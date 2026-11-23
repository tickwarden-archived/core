# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/tui/button - clickable [ label ] for @s that runs a function
#
# INPUT vortex:tui in:
#   label   string with %tokens%                                   required
#   fn      function id "namespace:path" (no tags, no arguments)   required
#   hover   string with %tokens%                                   optional, default "Click to run"
#   args    compound for %name% tokens                             optional
# The click runs "/function <fn>" as the player, so the player needs permission to use /function
# (the toggle buttons of api/toggle/show work the same way). fn is checked with
# systems/validate/function_id before it reaches the macro line; label and hover stay in storage.
# RETURN 1 when sent, 0 when an input is missing or fn is not a valid function id.
execute unless data storage vortex:tui in.fn run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:tui in.fn
execute unless function vortex:systems/validate/function_id run return 0
function vortex:core/internal/tui/render_label
execute unless data storage vortex:tui l run return 0
function vortex:core/internal/tui/render_hover
data modify storage vortex:tui b set value {}
data modify storage vortex:tui b.fn set from storage vortex:tui in.fn
function vortex:core/internal/tui/button_send with storage vortex:tui b
data remove storage vortex:tui b
return 1
