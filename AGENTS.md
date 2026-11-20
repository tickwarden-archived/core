# Rules for agents working on this repository

## Validation: static first, locked-down local server only as an exception

Validation is static by default:

- `scripts/spyglass-check.mjs` (Spyglass) must finish with 0 errors /
  0 warnings;
- `scripts/check-namespace.mjs` must pass;
- every JSON file in the pack must parse;
- the `git diff` must be reviewed against the target Minecraft version's
  documented changes.

A local Minecraft server and/or player bot (e.g. Mineflayer) may be run
to test or validate this datapack **only** when static validation is not
enough, and **only** under all of these mandatory conditions:

- `server-ip=127.0.0.1` in `server.properties` — the server binds to
  loopback only and is unreachable from any other machine;
- `white-list=true` **and** `enforce-whitelist=true`, with the
  designated local test bot as the **only** whitelist entry — no real
  player accounts, ever;
- port forwarding stays private/off: no router forwarding, no tunnel
  (e.g. ngrok/playit), no public or shared preview URL, no server-list
  registration, no advertising or inviting players;
- the bot is a test harness only: it must never be used to inflate a
  player count, idle for visibility, or make any server look populated
  or trustworthy;
- no real player account may ever connect, not even to the locked-down
  server: Minecraft servers log connection IPs and usernames
  (`logs/`, `usercache.json`), so a real account would leak exactly
  that data for zero test benefit. The offline-mode test bot exists
  precisely so no real identity is ever involved;
- the run stays on the machine it was started on, for the duration of
  the test only, and is shut down when the test ends.

If any of these conditions cannot be met, the server/bot run is
prohibited — fall back to static validation and say explicitly in the PR
description what could not be validated.

## Why

A publicly reachable test server with fake/test players can mislead real
players ("crowded looks safe"), can be abused for phishing, and can get
a server reported or blocklisted — an ethical and legal problem, not
just a technical one. A loopback-only, whitelist-locked server that
nobody else can reach or even see carries none of that risk, which is
the only reason it is allowed.
