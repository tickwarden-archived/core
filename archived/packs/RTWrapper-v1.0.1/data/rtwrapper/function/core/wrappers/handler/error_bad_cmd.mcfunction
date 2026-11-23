# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# cmd was present but did not match any core/wrappers/internal/<cmd>.mcfunction dispatcher.
scoreboard players add #errors rtw.status 1
$execute if score #silent rtw.config matches 0 run tellraw @a[tag=rtwrapper.debug] [{"text":"[RTWrapper] unknown cmd: ","color":"red"},{"text":"$(cmd)","color":"white"}]
