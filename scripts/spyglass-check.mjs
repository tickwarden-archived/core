// Headless Spyglass check for a pure datapack repository.
// Usage: node scripts/spyglass-check.mjs [projectRoot]
// Exit code 1 when at least one error-level diagnostic is found.
import { ErrorSeverity, fileUtil, ProfilerFactory, Service } from '@spyglassmc/core'
import { NodeJsExternals } from '@spyglassmc/core/lib/nodejs.js'
import * as je from '@spyglassmc/java-edition'
import * as mcdoc from '@spyglassmc/mcdoc'
import { mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join, resolve } from 'node:path'
import { fileURLToPath, pathToFileURL } from 'node:url'

const root = resolve(process.argv[2] ?? '.')
const cacheRoot = process.env.SPYGLASS_CACHE_DIR ?? mkdtempSync(join(tmpdir(), 'spyglass-cache-'))

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

const service = new Service({
	logger,
	profilers: new ProfilerFactory(logger, []),
	project: {
		cacheRoot: fileUtil.ensureEndingSlash(pathToFileURL(cacheRoot).toString()),
		externals: NodeJsExternals,
		initializers: [mcdoc.initialize, je.initialize],
		projectRoots: [fileUtil.ensureEndingSlash(pathToFileURL(root).toString())],
	},
})

const diagnostics = new Map()
service.project.on('documentErrored', ({ uri, errors }) => {
	if (errors.length) diagnostics.set(uri, errors)
	else diagnostics.delete(uri)
})

await service.project.ready()
await service.project.analyzeProject()

const names = ['hint', 'info', 'warning', 'error']
let errors = 0
let warnings = 0
for (const [uri, list] of [...diagnostics].sort(([a], [b]) => a.localeCompare(b))) {
	const file = fileURLToPath(uri).replace(root + '/', '')
	for (const e of list) {
		if (e.severity < ErrorSeverity.Warning) continue
		const level = names[e.severity]
		const doc = service.project.getClientManaged(uri)?.doc
		const pos = doc ? doc.positionAt(e.range.start) : { line: 0, character: 0 }
		const line = pos.line + 1
		const col = pos.character + 1
		console.log(`::${level === 'error' ? 'error' : 'warning'} file=${file},line=${line},col=${col}::${e.message}`)
		if (e.severity === ErrorSeverity.Error) errors++
		else warnings++
	}
}

if (setupFailures > 0) {
	console.error(`::error::Spyglass could not load ${setupFailures} required dependency(ies); results are not reliable`)
	process.exit(1)
}

console.log(`Spyglass finished: ${errors} error(s), ${warnings} warning(s) in ${diagnostics.size} file(s)`)
await service.project.close?.()
process.exit(errors > 0 ? 1 : 0)
