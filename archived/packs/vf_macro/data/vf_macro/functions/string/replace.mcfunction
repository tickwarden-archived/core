# EOL entry guard; legacy Minecraft requires each command to be gated.
# vf_macro:string/replace
# 1.16–1.19.3 cannot do arbitrary substring replace (no set string).
# This function only handles the full-string case; partial replace is done
# by core/macro/expand_tokens via resolved-list join (same visual result as parts).
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string out set from storage vf_macro:string in.string
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string tmp.check set from storage vf_macro:string in.string
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute store success score #vf_macro.cmp vf_macro run data modify storage vf_macro:string tmp.check set from storage vf_macro:string in.old
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.cmp vf_macro matches 0 run data modify storage vf_macro:string out set from storage vf_macro:string in.new
