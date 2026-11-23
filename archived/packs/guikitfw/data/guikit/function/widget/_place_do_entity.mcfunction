# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(slot) $(item) $(id) $(type) $(menu)
$item replace entity @e[type=#guikit:container,tag=guikit.me,limit=1] container.$(slot) with $(item)[custom_data={guikit:{widget:1,type:"$(type)",id:"$(id)",pack:"guikit",menu:"$(menu)"}},max_stack_size=1]
