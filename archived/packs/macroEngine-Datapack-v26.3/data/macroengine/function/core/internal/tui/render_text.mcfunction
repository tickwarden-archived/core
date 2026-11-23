# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/tui/render_text [INTERNAL]
# Renders macroengine:tui in.text (with %tokens%, in.args) into the plain string macroengine:tui t.
# Leaves t unset when in.text is missing or the template is invalid.
data remove storage macroengine:tui t
data remove storage macroengine:store in
execute unless data storage macroengine:tui in.text run return 0
data modify storage macroengine:store in.template set from storage macroengine:tui in.text
execute if data storage macroengine:tui in.args run data modify storage macroengine:store in.args set from storage macroengine:tui in.args
execute if function macroengine:api/store/render run data modify storage macroengine:tui t set from storage macroengine:store out.string
