# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/tui/render_hover [INTERNAL]
# Renders macroengine:tui in.hover (with %tokens%, in.args) into the plain string macroengine:tui h.
# Falls back to "Click to run" when in.hover is missing or invalid.
data remove storage macroengine:tui h
data remove storage macroengine:store in
execute if data storage macroengine:tui in.hover run data modify storage macroengine:store in.template set from storage macroengine:tui in.hover
execute if data storage macroengine:tui in.hover if data storage macroengine:tui in.args run data modify storage macroengine:store in.args set from storage macroengine:tui in.args
execute if data storage macroengine:tui in.hover if function macroengine:api/store/render run data modify storage macroengine:tui h set from storage macroengine:store out.string
execute unless data storage macroengine:tui h run data modify storage macroengine:tui h set value "Click to run"
