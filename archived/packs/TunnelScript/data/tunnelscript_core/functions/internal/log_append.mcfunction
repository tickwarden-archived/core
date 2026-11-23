# EOL entry guard; legacy Minecraft requires each command to be gated.
# Record the command that was just pulsed, then trim the log to #log_max.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:log entries append from storage tunnelscript:in cmd
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:log last set from storage tunnelscript:in cmd
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #log_len tunnelscript.vars run data get storage tunnelscript:log entries
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #log_len tunnelscript.vars > #log_max tunnelscript.vars run data remove storage tunnelscript:log entries[0]
