# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/string/tooltip_item [MACRO]
execute if data storage macroengine:engine modules{string:0b} run return 0
$tellraw $(target) {"text":"$(text)","color":"$(color)","hover_event":{"action":"show_item","id":"$(item)","count":1}}
