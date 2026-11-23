# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:setup
# Runs on load (#minecraft:load) and at the start of demo/run_all.
# Defines three input rules. A datapack calls vortex:api/input/validate/rule
# itself and decides what a failure means.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

# only "yes" or "no", any case
function vortex:api/input/validate/rule_define {name:"yesno",rule:{allow:["yes","no"],ignore_case:1b}}
# only 0 or 1 (numbers are compared as text, so "1" and 1 both pass)
function vortex:api/input/validate/rule_define {name:"bit",rule:{allow:[0,1]}}
# anything except these names, any case
function vortex:api/input/validate/rule_define {name:"no_admin",rule:{deny:["admin","owner"],ignore_case:1b}}

# hook binds are persistent storage; register binds them once (guard inside)
function vortex_example:hook/register
