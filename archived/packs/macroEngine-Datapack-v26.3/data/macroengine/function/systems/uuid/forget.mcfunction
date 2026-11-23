# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ============================================================
# macroengine:systems/uuid/forget
# Deletes a UUID entry from the cache
#
# USAGE:
# data modify storage macroengine:input key set value "benim_anahtarim"
# function macroengine:systems/uuid/forget
#
# INPUT:
# macroengine:input key → name of the key to delete
# ============================================================
execute if data storage macroengine:engine modules{uuid:0b} run return 0
function macroengine:core/internal/systems/uuid/forget_key with storage macroengine:input
