# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/wand/unregister_all — Clears all wand binds.
execute if data storage vortex:engine modules{wand:0b} run return 0
data modify storage vortex:engine wand_binds set value []
