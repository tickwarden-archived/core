# vortex:core/internal/callback/normalize_id
# String handling for vortex:callback in.id. RETURN 1 when in.id is now a safe, lower-case string, else 0
# (the reason goes to dbg.err). Uses the text module the same way systems/cmd_gate/check does:
# text/safe first, then text/lower.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

data modify storage vortex:callback _n.s set string storage vortex:callback in.id
execute store result score #vortex.cb_len vortex.tmp run data get storage vortex:callback _n.s
execute if score #vortex.cb_len vortex.tmp matches 0 run function vortex:systems/dbg/err {src:"callback",msg:"callback id is empty"}
execute if score #vortex.cb_len vortex.tmp matches 0 run data remove storage vortex:callback _n
execute if score #vortex.cb_len vortex.tmp matches 0 run return 0

data modify storage vortex:text s set from storage vortex:callback _n.s
execute store result score #vortex.cb_safe vortex.tmp run function vortex:core/internal/text/safe
execute if score #vortex.cb_safe vortex.tmp matches 0 run function vortex:systems/dbg/err {src:"callback",msg:"callback id has a quote or backslash"}
execute if score #vortex.cb_safe vortex.tmp matches 0 run function vortex:core/internal/text/reset
execute if score #vortex.cb_safe vortex.tmp matches 0 run data remove storage vortex:callback _n
execute if score #vortex.cb_safe vortex.tmp matches 0 run return 0

function vortex:core/internal/text/lower
execute store success score #vortex.cb_bad vortex.tmp if data storage vortex:text err
execute if score #vortex.cb_bad vortex.tmp matches 1 run function vortex:systems/dbg/err {src:"callback",msg:"callback id could not be normalized"}
execute if score #vortex.cb_bad vortex.tmp matches 1 run function vortex:core/internal/text/reset
execute if score #vortex.cb_bad vortex.tmp matches 1 run data remove storage vortex:callback _n
execute if score #vortex.cb_bad vortex.tmp matches 1 run return 0

data modify storage vortex:callback in.id set from storage vortex:text out
function vortex:core/internal/text/reset
data remove storage vortex:callback _n
return 1
