// Namespace discipline check for the Vortex datapack.
// Usage: node scripts/check-namespace.mjs [packRoot]   (default: vortex-dp)
//
// Every scoreboard objective, entity tag, team, bossbar and command storage
// this pack creates must live under the pack's own prefix — objectives and
// entity tags as `vortex.*`, storage/bossbar ids as `vortex:*` — otherwise
// two frameworks can create the same objective and silently corrupt each
// other's state. Lines with macro arguments ($(name)) are skipped: the name
// there is chosen by the caller, not by this pack. Comment lines are skipped
// too (they contain examples for other packs).
// Exit code 1 when any violation is found.
import { readFileSync, readdirSync } from 'node:fs'
import { join, resolve } from 'node:path'

const root = resolve(process.argv[2] ?? 'vortex-dp')
const dataDir = join(root, 'data')

const violations = []
const report = (file, line, kind, name) => violations.push(`${file}:${line}: ${kind} "${name}" is not vortex-prefixed`)

function* walk(dir) {
	let entries
	try {
		entries = readdirSync(dir, { withFileTypes: true })
	} catch {
		return
	}
	for (const entry of entries) {
		if (entry.isSymbolicLink()) continue
		const path = join(dir, entry.name)
		if (entry.isDirectory()) yield* walk(path)
		else if (entry.isFile()) yield path
	}
}

const OBJECTIVE_PREFIX = 'vortex.'
const NAMESPACE_PREFIX = 'vortex:'

for (const file of walk(dataDir)) {
	const rel = file.replace(root + '/', '')
	let text
	try {
		text = readFileSync(file, 'utf8')
	} catch {
		continue
	}
	if (file.endsWith('.mcfunction')) {
		text.split('\n').forEach((raw, i) => {
			const line = raw.trim()
			if (!line || line.startsWith('#') || line.includes('$(')) return
			const body = line.startsWith('$') ? line.slice(1) : line
			let m
			if ((m = body.match(/scoreboard objectives add (\S+)/))) {
				if (!m[1].startsWith(OBJECTIVE_PREFIX)) report(rel, i + 1, 'scoreboard objective', m[1])
			}
			if ((m = body.match(/\btag @\S+(?:\[[^\]]*\])? (?:add|remove) (\S+)/))) {
				if (!m[1].startsWith(OBJECTIVE_PREFIX)) report(rel, i + 1, 'entity tag', m[1])
			}
			if ((m = body.match(/\bteam add (\S+)/))) {
				if (!m[1].startsWith(OBJECTIVE_PREFIX)) report(rel, i + 1, 'team', m[1])
			}
			if ((m = body.match(/\bbossbar add (\S+)/))) {
				if (!m[1].startsWith(NAMESPACE_PREFIX)) report(rel, i + 1, 'bossbar', m[1])
			}
			for (const sm of body.matchAll(/\bstorage (\S+?:\S+)/g)) {
				if (!sm[1].startsWith(NAMESPACE_PREFIX)) report(rel, i + 1, 'storage', sm[1])
			}
		})
	} else if (file.endsWith('.json')) {
		// Objective names embedded in advancements/predicates.
		for (const m of text.matchAll(/"objective"\s*:\s*"([^"]+)"/g)) {
			if (!m[1].startsWith(OBJECTIVE_PREFIX)) {
				const line = text.slice(0, m.index).split('\n').length
				report(rel, line, 'scoreboard objective (json)', m[1])
			}
		}
	}
}

if (violations.length) {
	console.error(`Namespace check failed: ${violations.length} violation(s) under ${root}`)
	for (const v of violations) console.error(`  ${v}`)
	process.exit(1)
}
console.log(`Namespace check passed: all names under ${root} are vortex-prefixed`)
