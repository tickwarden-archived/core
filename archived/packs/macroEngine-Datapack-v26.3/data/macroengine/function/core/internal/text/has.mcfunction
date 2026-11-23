# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/has
# INPUT macroengine:text: s, needle.  RETURN 1 if s contains needle, else 0.
data modify storage macroengine:text n set value 1
return run function macroengine:core/internal/text/find
