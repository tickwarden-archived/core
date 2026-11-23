# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute store result score #vf_macro.engine_y vf_macro run data get storage vf_macro:config engine_y
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.engine_y vf_macro matches -64 run data modify block 0 -64 0 auto set value 0b
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless score #vf_macro.engine_y vf_macro matches -64 run data modify block 0 0 0 auto set value 0b
