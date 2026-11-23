# EOL entry guard; legacy Minecraft requires each command to be gated.
# Display multi-part result – most reliable form on 1.16–1.20
# tellraw_list is a list of {"text":"..."} compounds
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:out tellraw_list run tellraw @a {"nbt":"tellraw_list","storage":"vf_macro:out","interpret":true}
