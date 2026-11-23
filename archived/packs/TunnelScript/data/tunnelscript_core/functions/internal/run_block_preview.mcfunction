# EOL entry guard; legacy Minecraft requires each command to be gated.
# Dry-run: report the command instead of executing it. No block is placed and
# no forceload is taken, so a preview cannot touch the world at all.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players add #dryrun_count tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @a [{"text":"[TS/dry] ","color":"gold"},{"storage":"tunnelscript:in","nbt":"cmd","color":"white","plain":true,"interpret":false}]
