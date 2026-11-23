# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Add forceload
execute if data storage vortex:engine modules{cmd:0b} run return 0
forceload add 0 0

# Execute command from storage using marker + command block
setblock 0 -64 0 minecraft:command_block{Command:"",auto:0b,TrackOutput:0b} replace
data modify block 0 -64 0 Command set from storage vortex:input cmd
data modify block 0 -64 0 auto set value 1b

schedule function vortex:api/cmd/run_cb_reset 2t replace
