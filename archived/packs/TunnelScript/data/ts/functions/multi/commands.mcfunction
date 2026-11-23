# EOL entry guard; legacy Minecraft requires each command to be gated.
# Run many full command strings through the command-block runner.
# Input: storage tunnelscript:in { commands:["say one","say two"] }
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function ts:run_commands
