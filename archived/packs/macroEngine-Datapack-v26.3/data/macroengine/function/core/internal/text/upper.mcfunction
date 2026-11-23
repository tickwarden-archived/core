# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/upper
# INPUT  macroengine:text: s    OUTPUT macroengine:text: out   (or err)   RETURN 1 on success, 0 on failure
# Case mapping for ASCII letters only.
# s must not contain a quote or backslash.
data modify storage macroengine:text tbl set value "upper"
return run function macroengine:core/internal/text/case
