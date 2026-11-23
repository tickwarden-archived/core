# EOL entry guard; legacy Minecraft requires each command to be gated.
# Leave preview mode; commands execute normally again.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #dryrun tunnelscript.vars 0
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"dry-run OFF","color":"green"},{"text":" - commands execute normally","color":"gray"}]
