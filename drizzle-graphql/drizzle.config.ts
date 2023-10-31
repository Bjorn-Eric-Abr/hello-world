import type { Config } from 'drizzle-kit'

export default {
	schema: './src/schema.ts',
	out: './drizzle',
	driver: 'pg',
	dbCredentials: {
		database: 'postgres',
		host: 'localhost',
		password: 'asdf',
		user: 'postgres',
	},
} satisfies Config
