# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/tui/render_text [INTERNAL]
# Renders vortex:tui in.text (with %tokens%, in.args) into the plain string vortex:tui t.
# Leaves t unset when in.text is missing or the template is invalid.
data remove storage vortex:tui t
data remove storage vortex:store in
execute unless data storage vortex:tui in.text run return 0
data modify storage vortex:store in.template set from storage vortex:tui in.text
execute if data storage vortex:tui in.args run data modify storage vortex:store in.args set from storage vortex:tui in.args
execute if function vortex:api/store/render run data modify storage vortex:tui t set from storage vortex:store out.string
