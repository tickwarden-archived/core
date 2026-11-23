# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/hook/unbind_all
# Clears all hook binds.

execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:engine hook_binds set value []
