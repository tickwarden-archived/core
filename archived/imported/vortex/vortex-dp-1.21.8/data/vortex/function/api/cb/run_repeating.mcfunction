# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/cb/run_repeating
# ─────────────────────────────────────────────────────────────────
# Runs ONE command several times, a fixed number of ticks apart.
# Shorthand for api/cb/run_sequence with the same command repeated.
#
# INPUT  (storage vortex:input cb):
#   cmd       (string)  — the command to repeat          [REQUIRED]
#   times     (int)     — how many runs, 1..100          [REQUIRED]
#   interval  (int)     — ticks between runs, >= 1       [default: 2]
#   x         (int)     — CB block X  [default: 0]
#   y         (int)     — CB block Y  [default: -64]
#   z         (int)     — CB block Z  [default: 0]
#
# OUTPUT (storage vortex:output):
#   cb_id   (int)  — one id shared by every run; api/cb/cancel_id cancels the
#                     runs that have not fired yet
#
# Numbers are read as numbers and compared on a scoreboard; cmd is copied
# between storages and never pasted into a macro line. Entries share the
# fire spacing of api/cb (see docs/cb.md), so an interval of 1 runs at 2.
#
# EXAMPLE:
#   data modify storage vortex:input cb set value {cmd:"say tick",times:5,interval:20}
#   function vortex:api/cb/run_repeating
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cb:0b} run return 0
execute unless data storage vortex:input cb.cmd run function vortex:systems/dbg/err {src:"cb",msg:"cb.cmd not set"}
execute unless data storage vortex:input cb.cmd run return 0
execute unless data storage vortex:input cb.times run function vortex:systems/dbg/err {src:"cb",msg:"cb.times not set"}
execute unless data storage vortex:input cb.times run return 0

scoreboard players set #cb_rep_n vortex.tmp 0
execute store result score #cb_rep_n vortex.tmp run data get storage vortex:input cb.times
execute unless score #cb_rep_n vortex.tmp matches 1..100 run function vortex:systems/dbg/err {src:"cb",msg:"cb.times must be a number from 1 to 100"}
execute unless score #cb_rep_n vortex.tmp matches 1..100 run return 0

execute unless data storage vortex:input cb.interval run data modify storage vortex:input cb.interval set value 2
scoreboard players set #cb_rep_i vortex.tmp 0
execute store result score #cb_rep_i vortex.tmp run data get storage vortex:input cb.interval
execute unless score #cb_rep_i vortex.tmp matches 1.. run function vortex:systems/dbg/err {src:"cb",msg:"cb.interval must be a number >= 1"}
execute unless score #cb_rep_i vortex.tmp matches 1.. run return 0

function vortex:core/internal/api/cb/apply_defaults

# Build cb.cmds = [cmd, cmd, ...] (times copies), then hand it to the sequence expander
data modify storage vortex:input cb.cmds set value []
function vortex:core/internal/api/cb/repeat_build
data remove storage vortex:input cb.cmd
data remove storage vortex:input cb.times
function vortex:core/internal/systems/cb/seq_expand
data remove storage vortex:input cb
scoreboard players reset #cb_rep_n vortex.tmp
scoreboard players reset #cb_rep_i vortex.tmp
