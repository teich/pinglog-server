use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pinglog_server, PinglogServer.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Set a higher stacktrace during test
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :pinglog_server, PinglogServer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pinglog_server_test",
  pool: Ecto.Adapters.SQL.Sandbox
