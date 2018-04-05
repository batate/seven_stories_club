# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :seven_stories_club,
  ecto_repos: [SevenStoriesClub.Repo]

# Configures the endpoint
config :seven_stories_club, SevenStoriesClubWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SevenStoriesClubWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SevenStoriesClub.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: SevenStoriesClub.Coherence.User,
  repo: SevenStoriesClub.Repo,
  module: SevenStoriesClub,
  web_module: SevenStoriesClubWeb,
  router: SevenStoriesClubWeb.Router,
  messages_backend: SevenStoriesClubWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :registerable]

config :coherence, SevenStoriesClubWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
