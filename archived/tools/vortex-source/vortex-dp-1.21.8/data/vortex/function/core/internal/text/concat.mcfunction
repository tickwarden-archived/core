# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/concat
# INPUT  vortex:text: list (list of strings; numbers are converted)
# OUTPUT vortex:text: out (string)   on failure: err, out unset
# RETURN 1 on success, 0 on failure.
data remove storage vortex:text err
data remove storage vortex:text out
data modify storage vortex:text pc set value []
data remove storage vortex:text cl
data modify storage vortex:text cl set from storage vortex:text list
execute store result score #tx_r vortex.tmp run function vortex:core/internal/text/concat_loop
execute if data storage vortex:text err run return 0
function vortex:core/internal/text/join
return 1
