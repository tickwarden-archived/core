# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/tui/render_hover [INTERNAL]
# Renders vortex:tui in.hover (with %tokens%, in.args) into the plain string vortex:tui h.
# Falls back to "Click to run" when in.hover is missing or invalid.
data remove storage vortex:tui h
data remove storage vortex:store in
execute if data storage vortex:tui in.hover run data modify storage vortex:store in.template set from storage vortex:tui in.hover
execute if data storage vortex:tui in.hover if data storage vortex:tui in.args run data modify storage vortex:store in.args set from storage vortex:tui in.args
execute if data storage vortex:tui in.hover if function vortex:api/store/render run data modify storage vortex:tui h set from storage vortex:store out.string
execute unless data storage vortex:tui h run data modify storage vortex:tui h set value "Click to run"
