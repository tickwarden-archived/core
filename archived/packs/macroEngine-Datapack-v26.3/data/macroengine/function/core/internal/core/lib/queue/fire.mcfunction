# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/core/lib/queue/fire
execute if data storage macroengine:engine queue[0].func if data storage macroengine:engine queue[0].player run function macroengine:core/internal/core/lib/queue/run_func_as with storage macroengine:engine queue[0]
execute if data storage macroengine:engine queue[0].func unless data storage macroengine:engine queue[0].player run function macroengine:core/internal/core/lib/queue/run_func with storage macroengine:engine queue[0]
execute if data storage macroengine:engine queue[0].cmd if data storage macroengine:engine queue[0].player run function macroengine:core/internal/core/lib/queue/run_cmd_as with storage macroengine:engine queue[0]
execute if data storage macroengine:engine queue[0].cmd unless data storage macroengine:engine queue[0].player run function macroengine:core/internal/core/lib/queue/run_cmd with storage macroengine:engine queue[0]
data remove storage macroengine:engine queue[0]
