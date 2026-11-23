# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:internal cur_key set from storage vf_macro:internal expand_keys[0]
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal expand_keys[0]

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:internal find set value "$(?)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"name"} run data modify storage vf_macro:internal find set value "$(name)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"amount"} run data modify storage vf_macro:internal find set value "$(amount)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"value"} run data modify storage vf_macro:internal find set value "$(value)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"player"} run data modify storage vf_macro:internal find set value "$(player)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"id"} run data modify storage vf_macro:internal find set value "$(id)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"msg"} run data modify storage vf_macro:internal find set value "$(msg)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"text"} run data modify storage vf_macro:internal find set value "$(text)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"count"} run data modify storage vf_macro:internal find set value "$(count)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"target"} run data modify storage vf_macro:internal find set value "$(target)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"cmd"} run data modify storage vf_macro:internal find set value "$(cmd)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"func"} run data modify storage vf_macro:internal find set value "$(func)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"selector"} run data modify storage vf_macro:internal find set value "$(selector)"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal {cur_key:"score"} run data modify storage vf_macro:internal find set value "$(score)"

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string in.key set from storage vf_macro:internal cur_key
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run function vf_macro:string/resolve
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:internal new set from storage vf_macro:string out
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:internal new run data modify storage vf_macro:internal new set value "$(?)"

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:internal seg_work set from storage vf_macro:out resolved
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out resolved set value []
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal seg_work[0] run function vf_macro:core/macro/expand_seg_loop

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal expand_keys[0] run function vf_macro:core/macro/expand_key_loop
