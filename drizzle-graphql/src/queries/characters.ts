import { characters } from '../../drizzle/schema'
import { db } from '../lib/db'
import { eq } from 'drizzle-orm'

export async function getCharacterById(id: number) {
	const result = await db.query.characters.findFirst({
		where: eq(characters.characterId, id),
		with: {
			homeWorld: true,
		},
	})

	return result
}
