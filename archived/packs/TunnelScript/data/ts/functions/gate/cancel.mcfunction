# EOL entry guard; legacy Minecraft requires each command to be gated.
# Cancel the currently pending gated action. Anyone can cancel (safety
# valve in case the requester disconnects) - clears the owner tag from
# everyone so the flow resets cleanly.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless data storage tunnelscript:gate pending run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"Nothing is pending confirmation.","color":"gray"}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if data storage tunnelscript:gate pending run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"Cancelled: ","color":"yellow"},{"storage":"tunnelscript:gate","nbt":"pending.label","color":"white","plain":true,"interpret":false}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data remove storage tunnelscript:gate pending
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tag @a remove tunnelscript_gate_owner
