# EOL entry guard; legacy Minecraft requires each command to be gated.
# Copy storage tunnelscript:in from -> storage tunnelscript:out copied.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:out copied set from storage tunnelscript:in from
