import { relations } from 'drizzle-orm'
import * as ds from '../../drizzle/schema'
export * from '../../drizzle/schema'

// Relations

export const homeWorldRelations = relations(ds.homeworlds, ({ many }) => ({
	characters: many(ds.characters),
}))

export const characterRelations = relations(ds.characters, ({ one }) => ({
	homeWorld: one(ds.homeworlds, {
		fields: [ds.characters.characterId],
		references: [ds.homeworlds.homeworldId],
	}),
}))
