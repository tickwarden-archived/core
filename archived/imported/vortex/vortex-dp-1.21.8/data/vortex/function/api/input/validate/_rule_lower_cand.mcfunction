# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/input/validate/_rule_lower_cand (internal)
# Lower-cases the rule entry in vortex:input_validate _r.cand; an entry with a quote or backslash stays as written.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

data modify storage vortex:text s set from storage vortex:input_validate _r.cand
execute store result score #vortex.vr_safe vortex.tmp run function vortex:core/internal/text/safe
execute if score #vortex.vr_safe vortex.tmp matches 0 run return run function vortex:core/internal/text/reset
function vortex:core/internal/text/lower
execute unless data storage vortex:text err run data modify storage vortex:input_validate _r.cand set from storage vortex:text out
function vortex:core/internal/text/reset
