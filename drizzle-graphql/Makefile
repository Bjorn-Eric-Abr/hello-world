seed:
	psql -h localhost -U postgres -d postgres -f star-wars.sql

studio:
	pnpm drizzle-kit studio

db-start:
	docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=asdf -d postgres

db-clean:
	docker rm -f postgres
