# EOL entry guard; legacy Minecraft requires each command to be gated.
# Store the length of storage tunnelscript:in list[] into #out (tunnelscript.vars).
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #out tunnelscript.vars run data get storage tunnelscript:in list
