# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run forceload add 1 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run setblock 1 0 1 minecraft:oak_sign{Text1:'{"text":""}'} replace
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string sign_payload set value {text:"",extra:[]}
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:string sign_payload.extra set from storage vf_macro:string extra
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out sign_payload set from storage vf_macro:string sign_payload
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify block 1 0 1 Text1 set value '{"text":"[VF Macro] multi-token: enable multi_exec 1b"}'
