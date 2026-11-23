# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/input/private/book_capture  [INTERNAL — do not call directly]
# ======================================================================================
#
# Runs with @s bound to a single player holding the marked writable_book.
# Extracts SelectedItem.components."minecraft:writable_book_content".pages[0].raw
# into vortex:input storage. Read-only capture, no execution.
#
# The book is NOT cleared. One-shot is enforced with a per-player debounce tag
# (vortex.book_captured) so the same held book does not re-fire every tick.
# Tag is cleared when the player stops holding the marked book (see writable_book).
#
# book.raw is a RAW, UNVALIDATED string — same contract as cbm.command. If the caller needs it as a number/bool/tag-safe literal,
# run it through vortex:api/input/validate/check first:
#   function vortex:api/input/validate/check with storage <yourpath> {source:"book.raw", type:"int"}
# ======================================================================================

# Already captured this hold-session — keep book, skip re-fire
execute if entity @s[tag=vortex.book_captured] run return 0

data modify storage vortex:input book.player set from entity @s UUID
data modify storage vortex:input book.raw set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw

# Same "raw, unvalidated, unexecuted" contract as command_block_minecart capture.
function #vortex:input/writable_book

# Debounce: book stays in hand; will not re-capture until they unselect the marked book
tag @s add vortex.book_captured
