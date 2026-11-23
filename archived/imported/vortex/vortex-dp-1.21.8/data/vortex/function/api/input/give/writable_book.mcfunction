# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/input/give/writable_book
give @s minecraft:writable_book[minecraft:custom_data={vortex:{input:1b,inputItem:"writable_book"}}] 1
