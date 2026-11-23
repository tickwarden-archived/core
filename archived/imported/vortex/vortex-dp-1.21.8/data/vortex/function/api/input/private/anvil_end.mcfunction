# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/input/private/anvil_end  [INTERNAL]
# @s = player. Closes the anvil session.
tag @s remove vortex.anvil_session
tag @s remove vortex.anvil_hidden
scoreboard players reset @s vortex.anvil_t
