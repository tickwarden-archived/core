# EOL entry guard; legacy Minecraft requires each command to be gated.
# Clamp #in into [#min, #max] (objective tunnelscript.vars); result in #out.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players operation #out tunnelscript.vars = #in tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #out tunnelscript.vars < #min tunnelscript.vars run scoreboard players operation #out tunnelscript.vars = #min tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #out tunnelscript.vars > #max tunnelscript.vars run scoreboard players operation #out tunnelscript.vars = #max tunnelscript.vars
