# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Convenience macro wrapper for: /give <target> <item>[components] <count>
# Required storage keys: target, item, components, count. Use components:"" when omitted.
$give $(target) $(item)$(components) $(count)
