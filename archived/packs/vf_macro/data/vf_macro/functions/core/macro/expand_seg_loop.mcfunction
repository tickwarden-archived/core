# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:internal seg set from storage vf_macro:internal seg_work[0]
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal seg_work[0]

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.seg_done vf_macro 0

# 1) Exact token match
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string tmp.check set from storage vf_macro:internal seg
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute store success score #vf_macro.cmp vf_macro run data modify storage vf_macro:string tmp.check set from storage vf_macro:internal find
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.cmp vf_macro matches 0 run data modify storage vf_macro:out resolved append from storage vf_macro:internal new
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.cmp vf_macro matches 0 run scoreboard players set #vf_macro.seg_done vf_macro 1

# 2) Known full-template patterns for this token (covers normal usage)
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.seg_done vf_macro matches 0 run function vf_macro:core/macro/split_patterns

# 3) Fallback: keep segment as-is
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.seg_done vf_macro matches 0 run data modify storage vf_macro:out resolved append from storage vf_macro:internal seg

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal seg_work[0] run function vf_macro:core/macro/expand_seg_loop
