defmodule SevenStoriesClub.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias SevenStoriesClub.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import SevenStoriesClubWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SevenStoriesClub.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(SevenStoriesClub.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(SevenStoriesClub.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
