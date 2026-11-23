# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string in
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string out
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string tmp
