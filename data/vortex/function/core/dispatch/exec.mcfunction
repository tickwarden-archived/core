# ─────────────────────────────────────────────────────────────────
# vortex:core/dispatch/exec [MACRO]
# THE ONLY file in vortex that executes $function $(func).
# Do NOT call directly — use #vortex:internal/dispatch.
#
# INPUT (vortex:engine._dispatch): func → fully-qualified function name
#
# "with storage vortex:engine _dispatch" forwards the entire _dispatch
# compound as macro context to the target function — not just func.
# This lets callers stash extra fields (alongside func) on _dispatch
# before dispatching, and have the target read them as $(...) macro
# args, without this gateway needing to know what those fields are.
# Added so vortex:core/lib/fiber/internal/resume_dispatch (dispatched
# via the process_queue -> queue_run_func -> #vortex:internal/dispatch
# chain) can read $(id)/$(resume) directly instead of relying on a
# separate shared FIFO list that could desync between concurrent
# fibers — see resume_dispatch.mcfunction for the full explanation.
# ─────────────────────────────────────────────────────────────────

execute unless entity @a run return 0

execute if data storage vortex:engine modules{macro_function:0b} run return 0
$function $(func) with storage vortex:engine _dispatch
