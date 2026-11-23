# EOL entry guard; legacy Minecraft requires each command to be gated.
# Preview mode: every command that reaches the runner is printed instead of
# executed. Nothing is placed, no forceload is taken, the world is untouched.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #dryrun tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"dry-run ON","color":"gold"},{"text":" - commands are previewed, not executed","color":"gray"}]
