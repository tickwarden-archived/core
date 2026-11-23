# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/wait/cmd_as [MACRO]
$data modify storage vortex:engine queue append value {cmd:"$(cmd)", delay:$(delay), player:"$(player)"}
