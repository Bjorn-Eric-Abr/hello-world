import { drizzle } from 'drizzle-orm/postgres-js'
import postgres from 'postgres'
import * as schema from './schema'

export const client = postgres(
	'postgres://postgres:asdf@localhost:5432/postgres',
)

export const db = drizzle(client, { schema })
