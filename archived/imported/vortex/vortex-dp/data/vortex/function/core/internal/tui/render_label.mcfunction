# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/tui/render_label [INTERNAL]
# Renders vortex:tui in.label (with %tokens%, in.args) into the plain string vortex:tui l.
# Leaves l unset when in.label is missing or the template is invalid.
data remove storage vortex:tui l
data remove storage vortex:store in
execute unless data storage vortex:tui in.label run return 0
data modify storage vortex:store in.template set from storage vortex:tui in.label
execute if data storage vortex:tui in.args run data modify storage vortex:store in.args set from storage vortex:tui in.args
execute if function vortex:api/store/render run data modify storage vortex:tui l set from storage vortex:store out.string
