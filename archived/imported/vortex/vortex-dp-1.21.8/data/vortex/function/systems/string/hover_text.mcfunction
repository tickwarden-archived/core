# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/string/hover_text [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw $(target) {"text":"$(text)","color":"$(color)","hover_event":{"action":"show_text","value":{"text":"$(hover)","color":"$(hover_color)"}}}
