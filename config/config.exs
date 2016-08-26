# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :operator,
  ecto_repos: [Operator.Repo]

# Configures the endpoint
config :operator, Operator.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tSFLmhnYmvehESp6UMfJrcMSAtohmoD7vSYtW21de4DR1xsYvCuzlJ6f5wX15nGL",
  render_errors: [view: Operator.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Operator.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
