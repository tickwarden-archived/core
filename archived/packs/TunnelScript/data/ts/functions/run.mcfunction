# EOL entry guard; legacy Minecraft requires each command to be gated.
# Run a typed action list (cmd/command types only). Input:
#   { "actions": [
#       { "type": "cmd", "value": "say hello" },
#       { "type": "command", "value": "tp @p 0 100 0" }
#   ] }
# Other action types (function, function_with, give, etc.) are silently
# skipped on the 1.19.2 build because dynamic dispatch requires macros.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/guard
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #allowed tunnelscript.vars matches 1 run function tunnelscript_core:internal/do_run
