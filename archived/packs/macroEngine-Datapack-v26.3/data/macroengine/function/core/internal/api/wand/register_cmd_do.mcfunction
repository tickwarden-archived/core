# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/wand/internal/register_cmd_do [MACRO] [INTERNAL]
# Called by wand/register_cmd with storage macroengine:input {} to do the actual append.
# INPUT: $(tag), $(cmd)
$data modify storage macroengine:engine wand_binds append value {tag:"$(tag)", cmd:"$(cmd)"}
