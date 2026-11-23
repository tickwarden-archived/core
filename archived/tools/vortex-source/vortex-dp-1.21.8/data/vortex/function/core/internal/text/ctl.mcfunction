# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/ctl
# RETURN 1 when vortex:text s contains a newline, a carriage return or a tab, else 0.
# Such characters cannot be substituted into a macro line, so validators reject them.
# Static comparisons only, no macros. Touches only cf, sc, sq.
data modify storage vortex:text cf set from storage vortex:text s
execute store result score #tx_sn vortex.tmp run data get storage vortex:text cf
execute if score #tx_sn vortex.tmp matches 0 run return 0
return run function vortex:core/internal/text/ctl_loop
