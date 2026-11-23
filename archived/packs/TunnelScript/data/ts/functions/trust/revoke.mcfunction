# EOL entry guard; legacy Minecraft requires each command to be gated.
# Revoke permission to use the gated dangerous actions from the calling
# entity.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tag @s remove tunnelscript.trusted
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s ["",{"text":"[TunnelScript] ","color":"aqua"},{"text":"Revoked: gated actions are now blocked for you.","color":"gray"}]
