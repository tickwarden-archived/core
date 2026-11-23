# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:input/private/anvil_done  [INTERNAL]
# @s = player, at @s, with the renamed carrier on the cursor. Capture, then end
# the session (capture fires the #macroengine:input/anvil hook).
function macroengine:input/private/anvil_capture
function macroengine:input/private/anvil_end
