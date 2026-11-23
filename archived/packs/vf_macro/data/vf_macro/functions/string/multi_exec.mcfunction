# EOL entry guard; legacy Minecraft requires each command to be gated.
# Queue all parts; step pops and runs one-by-one
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string exec_list set from storage vf_macro:string parts
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run function vf_macro:string/multi_exec_step
