# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:world/time/get
# `time query minecraft:day repetition` do not exist on 1.21.8. They map to the
# older `daytime` and `day` arguments respectively (confirmed against the
# 0..23999 range checks in world/time/phase, which need daytime, not day count).
execute store result storage vortex:output daytime int 1 run time query daytime
execute store result storage vortex:output total int 1 run time query gametime
execute store result storage vortex:output day int 1 run time query day
