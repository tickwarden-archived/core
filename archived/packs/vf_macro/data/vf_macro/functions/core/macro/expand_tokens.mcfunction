# EOL entry guard; legacy Minecraft requires each command to be gated.
# Start with single segment = full template
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out resolved set value []
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out resolved append from storage vf_macro:internal cmd

# No keys → done (literal template)
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:internal present_keys[0] run data modify storage vf_macro:out note set value "no placeholders"

# For each key, split all segments on that token
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:internal expand_keys set from storage vf_macro:internal present_keys
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal expand_keys[0] run function vf_macro:core/macro/expand_key_loop
