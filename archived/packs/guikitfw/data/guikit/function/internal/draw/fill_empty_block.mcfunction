# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(slot) $(filler) $(x) $(y) $(z)
$execute unless items block $(x) $(y) $(z) container.$(slot) * run item replace block $(x) $(y) $(z) container.$(slot) with $(filler)[custom_data={guikit:{widget:1,type:"separator",id:"fill_$(slot)",pack:"guikit"}},max_stack_size=1]
