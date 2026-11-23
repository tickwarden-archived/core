# EOL entry guard; legacy Minecraft requires each command to be gated.
# vf_macro:string/set
# data modify storage vf_macro:string in.value set value "hello"
# function vf_macro:string/set
# → storage vf_macro:string out = "hello"
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string out set from storage vf_macro:string in.value
