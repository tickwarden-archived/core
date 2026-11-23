# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:input/private/anvil_end  [INTERNAL]
# @s = player. Closes the anvil session.
tag @s remove macroengine.anvil_session
tag @s remove macroengine.anvil_hidden
scoreboard players reset @s macroengine.anvil_t
