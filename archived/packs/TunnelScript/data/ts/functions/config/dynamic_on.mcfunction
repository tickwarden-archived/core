# EOL entry guard; legacy Minecraft requires each command to be gated.
# Allow stored command strings to execute through the command-block runner.
# OFF is the default: ts:run & friends are previewed/blocked until an
# operator turns this on. The tunnelscript.trusted tag and the
# confirmation gate (ts:gate/yes) are still required on top of this.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #dynamic_enabled tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"dynamic commands ON","color":"gold"},{"text":" - stored commands can execute (trusted + confirmation still required)","color":"gray"}]
