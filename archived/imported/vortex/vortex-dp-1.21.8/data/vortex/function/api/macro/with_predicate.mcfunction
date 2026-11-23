# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────
# vortex:api/macro/with_advancement [MACRO]
#

# Clear pipe
execute if data storage vortex:engine modules{macro:0b} run return 0
data remove storage vortex:engine _macro_pipe

# Default: not completed
$data modify storage vortex:engine _macro_pipe.$(var) set value "empty"

# Set to 1b if the player has completed the tag
$execute as @a[name=$(player),limit=1] if predicate $(condition) run data modify storage vortex:engine _macro_pipe.$(var) set value 1b
$execute as @a[name=$(player),limit=1] unless predicate $(condition) run data modify storage vortex:engine _macro_pipe.$(var) set value 0b

# Call target function with pipe as macro source
execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"api/macro/with_predicate"}
$function $(func) with storage vortex:engine _macro_pipe
