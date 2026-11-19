# Rules for agents working on this repository

## No server tests (hard rule)

Never start, run, connect to, or automate a Minecraft client, server, or
player bot (e.g. Mineflayer) to test or validate this datapack — not
locally, not in a sandbox, not in CI. This includes "just to check"
one-off runs, and it includes starting a server that a bot then joins.

Validation is static only:

- `scripts/spyglass-check.mjs` (Spyglass) must finish with 0 errors /
  0 warnings;
- `scripts/check-namespace.mjs` must pass;
- every JSON file in the pack must parse;
- the `git diff` must be reviewed against the target Minecraft version's
  documented changes.

If a change cannot be validated statically, say so explicitly in the PR
description instead of reaching for a server.

## Why

Test or fake players on a Minecraft server can mislead real players
("crowded looks safe") and can get a server reported or blocklisted.
This project does not accept that risk for test convenience.
