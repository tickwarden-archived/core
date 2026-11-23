// Headless Spyglass check for a pure datapack repository.
// Usage: node scripts/spyglass-check.mjs [projectRoot]
// Exit code 1 when at least one error-level diagnostic is found.
import { ErrorSeverity, EventDispatcher, fileUtil, ProfilerFactory, Service, UriStore } from '@spyglassmc/core'
import { NodeJsExternals } from '@spyglassmc/core/lib/nodejs.js'
import * as je from '@spyglassmc/java-edition'
import * as mcdoc from '@spyglassmc/mcdoc'
import { mkdtempSync, readFileSync, readdirSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join, resolve } from 'node:path'
import { fileURLToPath, pathToFileURL } from 'node:url'

const root = resolve(process.argv[2] ?? '.')
const cacheRoot = process.env.SPYGLASS_CACHE_DIR ?? mkdtempSync(join(tmpdir(), 'spyglass-cache-'))
const projectRoots = [fileUtil.ensureEndingSlash(pathToFileURL(root).toString())]

// Setup problems (e.g. vanilla data could not be downloaded) must fail the run,
// otherwise the check would silently pass without validating anything.
let setupFailures = 0
const isSetupFailure = (args) =>
	args.some((a) => typeof a === 'string' && /Bad dependency|\[callInitializers\]/.test(a))

const logger = {
	log: () => {},
	info: () => {},
	warn: (...a) => {
		if (isSetupFailure(a)) setupFailures++
		console.warn(...a)
	},
	error: (...a) => {
		if (isSetupFailure(a)) setupFailures++
		console.error(...a)
	},
}

// Project.ready() only tracks files reported by a FileWatcher; with no
// watcher it sees just the dependency archives, so analyzeProject() would
// analyze 0 project files and report success without checking anything.
// This static watcher performs a one-off recursive scan of the project roots
// (skipping the directories Spyglass excludes by default) so every project
// file is tracked before analysis.
class StaticFileWatcher extends EventDispatcher {
	#store = new UriStore()
	constructor(roots) {
		super()
		this.roots = roots
	}
	get watchedFiles() {
		return this.#store
	}
	async ready() {
		for (const rootUri of this.roots) {
			this.#scan(fileURLToPath(rootUri))
		}
	}
	async close() {}
	#scan(dir) {
		let entries
		try {
			entries = readdirSync(dir, { withFileTypes: true })
		} catch {
			return
		}
		for (const entry of entries) {
			if (entry.isSymbolicLink()) continue
			if (entry.isDirectory()) {
				if (entry.name.startsWith('.') || entry.name === 'node_modules' || entry.name === '__pycache__') continue
				this.#scan(join(dir, entry.name))
			} else if (entry.isFile()) {
				this.#store.add(pathToFileURL(join(dir, entry.name)).toString())
			}
		}
	}
}

const service = new Service({
	logger,
	profilers: new ProfilerFactory(logger, []),
	project: {
		cacheRoot: fileUtil.ensureEndingSlash(pathToFileURL(cacheRoot).toString()),
		externals: NodeJsExternals,
		initializers: [mcdoc.initialize, je.initialize],
		projectRoots,
	},
})

const diagnostics = new Map()
service.project.on('documentErrored', ({ uri, errors }) => {
	if (errors.length) diagnostics.set(uri, errors)
	else diagnostics.delete(uri)
})

await service.project.init()
await service.project.ready({ projectRootsWatcher: new StaticFileWatcher(projectRoots) })
const analysis = await service.project.analyzeProject()

// Known Spyglass false positives, suppressed with a hard count cap.
// Each entry matches one exact diagnostic shape (file and/or message, at one
// severity). `max` is the number of occurrences that exist today: if the
// count ever grows past it, the extra diagnostics are reported (and fail
// the run) instead of being hidden — so this list can never silently absorb
// new findings. Every entry names the Spyglass limitation behind it. Remove
// entries (do not raise `max`) once the pinned Spyglass versions catch up.
//
// Spyglass's vanilla-mcdoc (JSON schema) is a single, unversioned fetch
// (@spyglassmc/java-edition's getVanillaMcdoc takes no version argument) that
// uses pack_format-conditional attributes internally, and the command tree /
// mcmeta summary used for .mcfunction checking IS resolved per pack from its
// own pack.mcmeta (auto-detected release, see resolveConfiguredVersion in
// @spyglassmc/java-edition). So each pack root gets correctly version-aware
// checking automatically — but that also means the false positives below are
// specific to whichever Spyglass data version served THIS pack's resolved
// release at the time they were recorded. They are keyed by pack root and
// never shared across roots: an entry proven true for the 26.4-snapshot pack
// says nothing about the 1.21.8 pack's resolved (older) release, and vice
// versa. Don't copy an entry to a new root until it's actually been observed
// there — copying unseen is exactly the kind of invented fix this project
// avoids.
const SUPPRESSION_PROFILES = {
	'vortex-dp': [
		{
			id: 'return-int-form',
			message: 'Expected “fail” or “run”',
			severity: 'error',
			max: 133,
			reason: 'Spyglass\'s resolved 26.4-snapshot-4 command data has no numeric `return <int>` form; the syntax is valid vanilla and the whole pack parses with 0 errors on a real 26.4-snapshot-10 server. Remove once Spyglass\'s 26.4 data catches up.',
		},
		{
			id: 'unknown-key-loot-entry-functions',
			file: 'data/vortex/loot_table/player/head.json',
			message: 'Unknown key “functions”',
			severity: 'warning',
			max: 1,
			reason: 'Loot-entry "functions" list; Spyglass\'s 26.4-snapshot-4 loot-table schema does not know the key yet. Valid on a real 26.4-snapshot-10 server.',
		},
		{
			id: 'unknown-key-comment',
			message: 'Unknown key “_comment”',
			severity: 'warning',
			max: 2,
			reason: 'Documentation-only "_comment" keys in item_modifier JSON files; ignored by the game.',
		},
	],
	// Observed on CI and reproduced locally against this root, then verified
	// one by one on a real (loopback-only, whitelist-locked) 1.21.8 server:
	// every entry below is a Spyglass schema/grammar lag, not a pack bug.
	// Real 1.21.8 bugs found by the same sweep (never suppress those):
	// `api/cmd/time_of` could never instantiate (mixed-grammar macro) and the
	// dead 26.x keys `clock` (time_check predicates) / `Invisible`
	// (chest_minecart summon) — all fixed in the pack instead.
	'vortex-dp-1.21.8': [
		{
			id: 'sign-components-path-expected-nothing',
			file: 'data/vortex/function/api/input/private/sign_capture_from_components.mcfunction',
			message: 'Expected nothing',
			severity: 'error',
			max: 8,
			reason: 'Spyglass\'s resolved 1.21.8 sign block-entity NBT model rejects the quoted `components."minecraft:sign_text_front"` path. On a real 1.21.8 server the function executes with no error; the path silently no-ops where a sign block entity has no `components` compound, which is exactly the intended fallback (front_text is tried first in sign_capture). Verified on a local 1.21.8 server.',
		},
		{
			id: 'unknown-key-plain-1218',
			message: 'Unknown key “plain”',
			severity: 'warning',
			max: 35,
			reason: 'Text-component `plain` key (26.x) in tellraw/storage components shared with the 26.4 pack. 1.21.8 accepts and ignores it, and the storage/nbt component renders as plain text either way — verified with a text_display on a real 1.21.8 server. Remove once the pack drops the 26.x `plain` keys or Spyglass\'s 1.21.8 schemas learn them.',
		},
		{
			id: 'unknown-key-entity-type-1218',
			file: 'data/vortex/advancement/systems/hook/killed_by_arrow.json',
			message: 'Unknown key “entity_type”',
			severity: 'warning',
			max: 1,
			reason: 'Spyglass\'s resolved 1.21.8 entity-predicate schema only knows the old `type` key, but a real 1.21.8 server accepts `entity_type` and discriminates correctly (arrow matches, zombie does not). Kept identical to the 26.4 pack, where `entity_type` is the required key.',
		},
		{
			id: 'unknown-key-text-lectern-fallback',
			file: 'data/vortex/function/api/input/private/lectern_capture.mcfunction',
			message: 'Unknown key “text”',
			severity: 'warning',
			max: 1,
			reason: '`pages[0].text` fallback for 26.x-style book pages; 1.21.8 pages are read via `pages[0].raw` first (verified on a real 1.21.8 server: lectern capture returns the raw page text), and the fallback path silently no-ops when absent.',
		},
	],
}
const SUPPRESSED = SUPPRESSION_PROFILES[root.split('/').pop()] ?? []
if (SUPPRESSED.length === 0 && !(root.split('/').pop() in SUPPRESSION_PROFILES)) {
	console.log(`note: no suppression profile for pack root "${root.split('/').pop()}"; add one to SUPPRESSION_PROFILES if Spyglass reports a known-good false positive here`)
}
const suppressedCount = new Map(SUPPRESSED.map((r) => [r.id, 0]))
const matchSuppression = (file, level, message) => {
	for (const rule of SUPPRESSED) {
		if (rule.severity !== level) continue
		if (rule.file && rule.file !== file) continue
		const matches = rule.message instanceof RegExp ? rule.message.test(message) : rule.message === message
		if (!matches) continue
		if (suppressedCount.get(rule.id) >= rule.max) continue
		suppressedCount.set(rule.id, suppressedCount.get(rule.id) + 1)
		return rule
	}
	return undefined
}

const names = ['hint', 'info', 'warning', 'error']
let errors = 0
let warnings = 0
for (const [uri, list] of [...diagnostics].sort(([a], [b]) => a.localeCompare(b))) {
	const file = fileURLToPath(uri).replace(root + '/', '')
	// Diagnostics carry a 0-based posRange (and sometimes a raw offset
	// range). Files checked here are not client-managed, so
	// getClientManaged() has no document to map offsets with; fall back to
	// computing the position from the file text.
	let text
	try {
		text = readFileSync(fileURLToPath(uri), 'utf8')
	} catch {
		text = undefined
	}
	for (const e of list) {
		if (e.severity < ErrorSeverity.Warning) continue
		const level = names[e.severity]
		if (matchSuppression(file, level, e.message)) continue
		let line = 1
		let col = 1
		if (e.posRange?.start) {
			line = e.posRange.start.line + 1
			col = e.posRange.start.character + 1
		} else if (typeof e.range?.start === 'number' && text) {
			const start = e.range.start
			const before = text.slice(0, start)
			line = before.split('\n').length
			col = start - before.lastIndexOf('\n')
		}
		console.log(`::${level === 'error' ? 'error' : 'warning'} file=${file},line=${line},col=${col}::${e.message}`)
		if (e.severity === ErrorSeverity.Error) errors++
		else warnings++
	}
}

if (setupFailures > 0) {
	console.error(`::error::Spyglass could not load ${setupFailures} required dependency(ies); results are not reliable`)
	process.exit(1)
}

// An empty analysis means the checker validated nothing; never pass silently.
if (!analysis || analysis.totalFiles === 0) {
	console.error(`::error::Spyglass analyzed 0 files under ${root}; refusing to pass an empty check`)
	process.exit(1)
}

const suppressedTotal = [...suppressedCount.values()].reduce((a, b) => a + b, 0)
if (suppressedTotal > 0) {
	for (const rule of SUPPRESSED) {
		const count = suppressedCount.get(rule.id)
		if (count > 0) console.log(`note: suppressed ${count} known diagnostic(s) [${rule.id}] — ${rule.reason}`)
	}
}
console.log(`Spyglass finished: ${errors} error(s), ${warnings} warning(s) in ${analysis.analyzedFiles} file(s); ${suppressedTotal} known false positive(s) suppressed`)
await service.project.close?.()
process.exit(errors > 0 ? 1 : 0)
