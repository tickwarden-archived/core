# vortex:core/internal/notice/load [INTERNAL]
# Registers the per-player "has seen the notice" flag. Called from vortex:setup after the
# dialog module is loaded. Players who have not seen the notice get it on the next tick
# (core/internal/notice/tick), including players who are online during a /reload.
scoreboard objectives add vortex.notice_seen dummy
