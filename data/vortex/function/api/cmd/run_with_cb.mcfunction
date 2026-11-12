# Add forceload
execute if data storage vortex:engine modules{cmd:0b} run return 0
data modify storage vortex:cmd_gate in.cmd set from storage vortex:input cmd
execute unless function vortex:systems/cmd_gate/check run return 0
forceload add 0 0

# Execute command from storage using marker + command block
setblock 0 -64 0 minecraft:command_block{Command:"",auto:0b,TrackOutput:0b} replace
data modify block 0 -64 0 Command set from storage vortex:input cmd
data modify block 0 -64 0 auto set value 1b

schedule function vortex:api/cmd/run_cb_reset 2t replace
