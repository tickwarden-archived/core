# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Multi-action entry point. Mirrors api/run.mcfunction, but for a batch of actions instead
# of one: set rtwrapper:api batch to an array of {cmd:...,params:{...}} objects, then
# /function rtwrapper:api/run_batch. Every action in the array is enqueued (in order, tagged
# with a shared batch_id) and then the normal immediate-drain runs, so all of them execute
# before this function returns, same as api/run.mcfunction does for a single action.
function rtwrapper:api/enqueue_batch
function rtwrapper:core/run/run_actions
