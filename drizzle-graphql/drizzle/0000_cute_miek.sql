-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TABLE IF NOT EXISTS "movies" (
	"movie_id" serial PRIMARY KEY NOT NULL,
	"title" varchar(100) NOT NULL,
	"release_year" integer,
	"director" varchar(100),
	"opening_crawl" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "planets" (
	"planet_id" serial PRIMARY KEY NOT NULL,
	"name" varchar(100) NOT NULL,
	"climate" varchar(100),
	"terrain" varchar(100),
	"population" integer,
	"featured_in_movie_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "characters" (
	"character_id" serial PRIMARY KEY NOT NULL,
	"name" varchar(100) NOT NULL,
	"species" varchar(50),
	"birth_year" varchar(10),
	"height" numeric(5, 2),
	"homeworld_id" integer,
	"appears_in_movie_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "homeworlds" (
	"homeworld_id" serial PRIMARY KEY NOT NULL,
	"name" varchar(100) NOT NULL,
	"climate" varchar(100),
	"terrain" varchar(100),
	"population" integer
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "planets" ADD CONSTRAINT "planets_featured_in_movie_id_fkey" FOREIGN KEY ("featured_in_movie_id") REFERENCES "movies"("movie_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "characters" ADD CONSTRAINT "characters_homeworld_id_fkey" FOREIGN KEY ("homeworld_id") REFERENCES "planets"("planet_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "characters" ADD CONSTRAINT "characters_appears_in_movie_id_fkey" FOREIGN KEY ("appears_in_movie_id") REFERENCES "movies"("movie_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

*/