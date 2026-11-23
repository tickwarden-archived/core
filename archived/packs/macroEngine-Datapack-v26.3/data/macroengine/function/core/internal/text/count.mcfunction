# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/count
# INPUT macroengine:text: s, needle.  RETURN number of non-overlapping occurrences.
data modify storage macroengine:text n set value 0
return run function macroengine:core/internal/text/find
