# vortex:core/internal/dialog/notification_render [MACRO]
function vortex:api/dialog/begin
$function vortex:api/dialog/title {text:$(title)}
$function vortex:api/dialog/body {text:$(body),width:$(width)}
function vortex:api/dialog/button {label:{text:"Continue"},callback:[{type:"function",function:"vortex:api/dialog/notification_next"}],payload:{}}
function vortex:api/dialog/notice
data modify storage vortex:dialog_work notification set value 1b
function vortex:api/dialog/show
