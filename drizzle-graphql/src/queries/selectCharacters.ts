import { characters } from '../../drizzle/schema'
import { db } from '../lib/db'

async function run() {
	const result = await db.select().from(characters).orderBy(characters.height)

	console.log('● result --> ', result)
	process.exit(0)
}
run()
