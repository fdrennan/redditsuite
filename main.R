library(redditsuite)



pg_connection <- dbConnect(
  drv = Postgres(),
  host = 'localhost',
  port = 5432,
  user = Sys.getenv("POSTGRES_USER"),
  password = Sys.getenv("POSTGRES_PASSWORD"),
  dbname = Sys.getenv("POSTGRES_DB")
)


dbCreateTable(pg_connection, 'mtcars', fields = mtcars)

dbListTables(pg_connection)

dbAppendTable(pg_connection, name = 'mtcars', mtcars)

mtcars_connection <-
  tbl(pg_connection, in_schema('public', 'mtcars'))

mtcars_connection %>%
  mutate(
    carb = carb * 2
  ) %>%
  show_query()
