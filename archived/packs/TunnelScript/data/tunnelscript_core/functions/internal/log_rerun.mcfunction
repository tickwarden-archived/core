# EOL entry guard; legacy Minecraft requires each command to be gated.
# Copy the newest log entry back into the runner input and run it.
# The cooldown guard still applies, exactly as for a normal ts:run_command.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:in cmd set from storage tunnelscript:log entries[-1]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/guard
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #allowed tunnelscript.vars matches 1 run function tunnelscript_core:internal/run_block
