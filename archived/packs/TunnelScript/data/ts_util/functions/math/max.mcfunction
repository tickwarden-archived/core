# EOL entry guard; legacy Minecraft requires each command to be gated.
# out = max(#a, #b) on tunnelscript.vars.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players operation #out tunnelscript.vars = #a tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #b tunnelscript.vars > #out tunnelscript.vars run scoreboard players operation #out tunnelscript.vars = #b tunnelscript.vars
