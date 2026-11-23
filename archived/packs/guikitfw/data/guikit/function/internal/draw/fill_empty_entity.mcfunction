# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(slot) $(filler)
$execute unless items entity @e[type=#guikit:container,tag=guikit.me,limit=1] container.$(slot) * run item replace entity @e[type=#guikit:container,tag=guikit.me,limit=1] container.$(slot) with $(filler)[custom_data={guikit:{widget:1,type:"separator",id:"fill_$(slot)",pack:"guikit"}},max_stack_size=1]
