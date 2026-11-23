# EOL entry guard; legacy Minecraft requires each command to be gated.
# Stores #vf_macro.value into args under path given by in.path if set, else "value"
# Default:
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:in path run execute store result storage vf_macro:args value int 1 run scoreboard players get #vf_macro.value vf_macro
# Custom path is not dynamically addressable without macros — use in.path as signal only for "value"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:in path run execute store result storage vf_macro:args value int 1 run scoreboard players get #vf_macro.value vf_macro
