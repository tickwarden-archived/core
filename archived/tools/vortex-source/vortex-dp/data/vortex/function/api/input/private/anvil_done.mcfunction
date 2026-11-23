# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/input/private/anvil_done  [INTERNAL]
# @s = player, at @s, with the renamed carrier on the cursor. Capture, then end
# the session (capture fires the #vortex:input/anvil hook).
function vortex:api/input/private/anvil_capture
function vortex:api/input/private/anvil_end
