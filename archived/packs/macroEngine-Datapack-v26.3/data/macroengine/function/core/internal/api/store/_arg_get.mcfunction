# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_arg_get [MACRO] [INTERNAL]
$data modify storage macroengine:store tmp.raw set from storage macroengine:store in.args.$(name)
