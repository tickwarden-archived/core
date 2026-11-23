# EOL entry guard; legacy Minecraft requires each command to be gated.
# Run many limited typed actions. Only cmd/command action types are handled
# on 1.19.2 because dynamic dispatch needs macros.
# Input: storage tunnelscript:in { actions:[{type:"cmd",value:"say hi"}] }
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function ts:run
