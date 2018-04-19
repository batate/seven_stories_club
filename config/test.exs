use Mix.Config

# We run a server during test for Wallaby integration testing.
config :seven_stories_club, SevenStoriesClubWeb.Endpoint,
  http: [port: 4001],
  server: true,
  secret_key_base: "0123456789012345678901234567890123456789012345678901234567890123456789"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :seven_stories_club, SevenStoriesClub.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "seven_stories_club_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :seven_stories_club, :sql_sandbox, true
