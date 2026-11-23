# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/config/ensure
# Makes sure the runtime config is complete and applied. One cheap check per tick: the revision
# marker written by config.mcfunction plus two applied scores. It covers worlds loaded by an older
# version, where the load pipeline does not run again and new keys would never be created.
# Adding a config key means adding it to config.mcfunction and bumping config_rev there.
execute if data storage vortex:engine {config_rev:4} if score #hook_interval vortex.tick matches 1.. if score #queue_cap vortex.tick matches 1.. if score #perm_enforce vortex.tick_flags matches 0.. run return 0
function vortex:core/config/init
function vortex:core/config/apply
