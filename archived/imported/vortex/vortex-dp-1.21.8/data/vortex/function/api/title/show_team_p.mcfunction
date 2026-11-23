# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/title/show_team_p [MACRO]
# show_p for every online member of a team. Input (macro arg): team. Storage input as show_p.
execute if data storage vortex:engine modules{title:0b} run return 0
$execute as @a[team=$(team)] run function vortex:api/title/show_p
