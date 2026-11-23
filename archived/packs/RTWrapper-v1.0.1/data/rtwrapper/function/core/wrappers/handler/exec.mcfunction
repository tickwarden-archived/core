# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Macro dispatch. `cmd` must match an internal wrapper dispatcher file name.
# Dispatch is off by default (score #dynamic, rtw.config): rtwrapper:api/dynamic/on enables it.
execute unless score #dynamic rtw.config matches 1 run return 0
$function rtwrapper:core/wrappers/internal/$(cmd)
