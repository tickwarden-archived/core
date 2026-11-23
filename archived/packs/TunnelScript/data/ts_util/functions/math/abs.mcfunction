# EOL entry guard; legacy Minecraft requires each command to be gated.
# out = |#in| on tunnelscript.vars.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players operation #out tunnelscript.vars = #in tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #out tunnelscript.vars matches ..-1 run scoreboard players operation #out tunnelscript.vars *= #neg_one tunnelscript.vars
