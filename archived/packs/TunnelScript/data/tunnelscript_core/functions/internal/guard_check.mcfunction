# EOL entry guard; legacy Minecraft requires each command to be gated.
# Helper: evaluate the cooldown window using the world game time.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #now tunnelscript.vars run time query gametime
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players operation #elapsed tunnelscript.vars = #now tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players operation #elapsed tunnelscript.vars -= #last_run tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #elapsed tunnelscript.vars < #cooldown_max tunnelscript.vars run scoreboard players set #allowed tunnelscript.vars 0
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #allowed tunnelscript.vars matches 1 run scoreboard players operation #last_run tunnelscript.vars = #now tunnelscript.vars
