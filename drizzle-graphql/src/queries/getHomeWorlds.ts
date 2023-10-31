import { characters } from '../../drizzle/schema'
import { db } from '../lib/db'
import { eq } from 'drizzle-orm'

async function run() {
	const response = await db.query.homeworlds.findFirst({
		with: {
			characters: true,
		},
	})
	console.log('● response --> ', response)
	process.exit(0)
}

run()
