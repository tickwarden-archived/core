# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/queue/fire
execute if data storage vortex:engine queue[0].func if data storage vortex:engine queue[0].player run function vortex:core/internal/core/lib/queue/run_func_as with storage vortex:engine queue[0]
execute if data storage vortex:engine queue[0].func unless data storage vortex:engine queue[0].player run function vortex:core/internal/core/lib/queue/run_func with storage vortex:engine queue[0]
execute if data storage vortex:engine queue[0].cmd if data storage vortex:engine queue[0].player run function vortex:core/internal/core/lib/queue/run_cmd_as with storage vortex:engine queue[0]
execute if data storage vortex:engine queue[0].cmd unless data storage vortex:engine queue[0].player run function vortex:core/internal/core/lib/queue/run_cmd with storage vortex:engine queue[0]
data remove storage vortex:engine queue[0]
