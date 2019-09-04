# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :cocktails, CocktailsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6mCxgwYqZu6M4sUeltKBpWAWoa156zXYwV3WOmg7W1V/3mqLvGSAp0iV9jkqvjjm",
  render_errors: [view: CocktailsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cocktails.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "+jS9eWwJLZRQ52gnn3pl46FApnIe/uc5"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
