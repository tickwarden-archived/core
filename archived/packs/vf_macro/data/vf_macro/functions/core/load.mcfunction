# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard objectives add vf_macro dummy
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.returned vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.if_success vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.version vf_macro 191
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #0 vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #1 vf_macro 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.skip vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.multi vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.resolve_done vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.engine_y vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.expanded vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.free_done vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.cmp vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.key_found vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.force_ok vf_macro 0

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:internal version set value "1.9.1"

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args amount
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args cmd
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args count
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args func
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args id
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args key
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args msg
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args name
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args path
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args player
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args pos
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args score
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args selector
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args storage
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args target
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args text
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args value
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args x
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args y
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:args z

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:config track_output run data modify storage vf_macro:config track_output set value 0b
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:config engine_y run data modify storage vf_macro:config engine_y set value 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:config multi_exec run data modify storage vf_macro:config multi_exec set value 0b

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run forceload add 0 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run forceload add 1 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run setblock 0 0 0 minecraft:command_block{Command:"",auto:0b,TrackOutput:0b} replace

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run tellraw @a [{"text":"[VF Macro] ","color":"aqua"},{"text":"v1.9.1 loaded (multi_exec fix, cleanup fix).","color":"white"}]