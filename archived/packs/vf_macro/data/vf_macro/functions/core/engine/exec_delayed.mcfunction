# EOL entry guard; legacy Minecraft requires each command to be gated.
# Runs 1t after setup — chunk should be forced by then
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:engine Command set from storage vf_macro:engine pending
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run function vf_macro:core/engine/exec
