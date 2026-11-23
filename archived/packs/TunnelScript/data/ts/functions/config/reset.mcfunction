# EOL entry guard; legacy Minecraft requires each command to be gated.
# Restore defaults (cooldown off, 256 actions per run).
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #cooldown_max tunnelscript.vars 0
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #max_actions tunnelscript.vars 256
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"[TunnelScript] configuration reset to defaults","color":"green"}
