# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/run_cmd [MACRO]
# INPUT: $(cmd)
# @s = the triggering player
execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/systems/hook/run_cmd"}
$$(cmd)
