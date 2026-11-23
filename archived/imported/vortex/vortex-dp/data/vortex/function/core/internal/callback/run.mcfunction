# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/callback/run
# THE shared callback runner. Every callback in the pack goes through here: the public
# api/callback/run is a thin wrapper.
# No module toggle and no config flag can switch it off.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# INPUT (storage vortex:callback in):
#   id      (string)  callback ID, e.g. "mypack:round_won"        [REQUIRED]
#   module  (string)  optional: "macro_cmd" | "macro_function"
#                     selects the module-specific tag below
#   site    (string)  optional: set by the blocked-macro hooks (function path)
#   args    (any)     optional payload
#
# FLOW
#   1. string handling: id is coerced to a string, rejected when empty or when it holds a
#      quote or backslash (text/safe), then lower-cased (text/lower)
#   2. in is pushed on storage vortex:callback stack and removed
#   3. module-specific tag first (#vortex:callback/<module>), then the shared tag
#   3. stack[-1] is removed and `top` is restored (or cleared), so storage is clean afterwards
#   `top` is a copy of stack[-1] made for handlers: filter it with top{id:"..."}, because
#   stack[-1]{...} is not valid NBT path syntax
#
# DEPTH: a handler may fire callbacks itself, up to 8 levels. A deeper call is dropped and
# logged to dbg.err, which also stops a handler that trips a blocked macro site from looping.
#
# RETURN 1 when dispatched, 0 when rejected.

execute unless data storage vortex:callback in.id run function vortex:systems/dbg/err {src:"callback",msg:"callback in.id not set"}
execute unless data storage vortex:callback in.id run return 0

execute store result score #vortex.cb_depth vortex.tmp run data get storage vortex:callback stack
execute if score #vortex.cb_depth vortex.tmp matches 8.. run function vortex:systems/dbg/err {src:"callback",msg:"callback depth limit reached"}
execute if score #vortex.cb_depth vortex.tmp matches 8.. run data remove storage vortex:callback in
execute if score #vortex.cb_depth vortex.tmp matches 8.. run return 0

execute store success score #vortex.cb_ok vortex.tmp run function vortex:core/internal/callback/normalize_id
execute if score #vortex.cb_ok vortex.tmp matches 0 run data remove storage vortex:callback in
execute if score #vortex.cb_ok vortex.tmp matches 0 run return 0


execute if data storage vortex:callback in.module unless data storage vortex:callback in{module:"macro_cmd"} unless data storage vortex:callback in{module:"macro_function"} run function vortex:systems/dbg/err {src:"callback",msg:"unknown callback module, shared tag only"}

data modify storage vortex:callback stack append from storage vortex:callback in
data remove storage vortex:callback in

# NBT paths cannot take a compound filter after an index ("stack[-1]{id:...}" fails to parse,
# "Invalid NBT path element"), so the active entry is mirrored to `top`, which handlers can filter.
data modify storage vortex:callback top set from storage vortex:callback stack[-1]

execute if data storage vortex:callback top{module:"macro_cmd"} run function #vortex:callback/macro_cmd
execute if data storage vortex:callback top{module:"macro_function"} run function #vortex:callback/macro_function
function #vortex:callback/dispatch

# pop, then point `top` back at the caller's entry (nested callbacks) or clear it
data remove storage vortex:callback stack[-1]
data remove storage vortex:callback top
execute if data storage vortex:callback stack[-1] run data modify storage vortex:callback top set from storage vortex:callback stack[-1]
return 1
