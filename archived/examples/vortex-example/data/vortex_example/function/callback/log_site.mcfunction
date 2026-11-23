# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:callback/log_site [MACRO]
# Writes the blocked site to dbg.out. $(site) is a constant from the guard line, not player input.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

$function vortex:systems/dbg/out {src:"vortex_example",msg:"blocked: $(site)"}
