import { pgTable, serial, varchar, integer, text, foreignKey, numeric } from "drizzle-orm/pg-core"

import { sql } from "drizzle-orm"


export const movies = pgTable("movies", {
	movieId: serial("movie_id").primaryKey().notNull(),
	title: varchar("title", { length: 100 }).notNull(),
	releaseYear: integer("release_year"),
	director: varchar("director", { length: 100 }),
	openingCrawl: text("opening_crawl"),
});

export const planets = pgTable("planets", {
	planetId: serial("planet_id").primaryKey().notNull(),
	name: varchar("name", { length: 100 }).notNull(),
	climate: varchar("climate", { length: 100 }),
	terrain: varchar("terrain", { length: 100 }),
	population: integer("population"),
	featuredInMovieId: integer("featured_in_movie_id").references(() => movies.movieId),
});

export const characters = pgTable("characters", {
	characterId: serial("character_id").primaryKey().notNull(),
	name: varchar("name", { length: 100 }).notNull(),
	species: varchar("species", { length: 50 }),
	birthYear: varchar("birth_year", { length: 10 }),
	height: numeric("height", { precision: 5, scale:  2 }),
	homeworldId: integer("homeworld_id").references(() => planets.planetId),
	appearsInMovieId: integer("appears_in_movie_id").references(() => movies.movieId),
});

export const homeworlds = pgTable("homeworlds", {
	homeworldId: serial("homeworld_id").primaryKey().notNull(),
	name: varchar("name", { length: 100 }).notNull(),
	climate: varchar("climate", { length: 100 }),
	terrain: varchar("terrain", { length: 100 }),
	population: integer("population"),
});