# vortex:systems/string/tooltip_item [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw $(target) {"text":"$(text)","color":"$(color)","hover_event":{"action":"show_item","id":"$(item)","count":1}}
