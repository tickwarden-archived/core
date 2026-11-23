# EOL entry guard; legacy Minecraft requires each command to be gated.
# parts[] strings → extra [{text:s}, ...]
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string extra set value []
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string build_list set from storage vf_macro:string parts
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run function vf_macro:string/build_extra_loop
