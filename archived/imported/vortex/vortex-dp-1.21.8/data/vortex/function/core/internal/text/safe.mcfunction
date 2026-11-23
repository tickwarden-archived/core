# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/safe
# RETURN 1 when vortex:text s contains neither a double quote nor a backslash, else 0.
# Anything that is rebuilt into a macro string literal must pass this first.
# Walks the string one character at a time without macros; touches only sf, sc, sq.
data modify storage vortex:text sf set from storage vortex:text s
execute store result score #tx_sn vortex.tmp run data get storage vortex:text sf
execute if score #tx_sn vortex.tmp matches 0 run return 1
return run function vortex:core/internal/text/safe_loop
