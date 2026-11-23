# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/input/validate/_rule_lower_s (internal)
# Lower-cases vortex:input_validate _r.s for ignore_case; sets _r.fail 1b when the text has a quote or backslash
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

data modify storage vortex:text s set from storage vortex:input_validate _r.s
execute store result score #vortex.vr_safe vortex.tmp run function vortex:core/internal/text/safe
execute if score #vortex.vr_safe vortex.tmp matches 0 run data modify storage vortex:input_validate _r.fail set value 1b
execute if score #vortex.vr_safe vortex.tmp matches 0 run return run function vortex:core/internal/text/reset
function vortex:core/internal/text/lower
execute if data storage vortex:text err run data modify storage vortex:input_validate _r.fail set value 1b
execute unless data storage vortex:text err run data modify storage vortex:input_validate _r.s set from storage vortex:text out
function vortex:core/internal/text/reset
