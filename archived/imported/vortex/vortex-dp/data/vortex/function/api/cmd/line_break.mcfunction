# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/cmd/line_break
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.line_break"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0

execute if data storage vortex:input {line_break:{n:2}} run tellraw @s {"text":"\n\n"}
execute if data storage vortex:input {line_break:{n:3}} run tellraw @s {"text":"\n\n\n"}
execute if data storage vortex:input {line_break:{n:4}} run tellraw @s {"text":"\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:5}} run tellraw @s {"text":"\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:6}} run tellraw @s {"text":"\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:7}} run tellraw @s {"text":"\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:8}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:9}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:10}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:11}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:12}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:13}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:14}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:15}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:16}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:17}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:18}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:19}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute if data storage vortex:input {line_break:{n:20}} run tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

data remove storage vortex:input line_break
