defmodule SevenStoriesClubWeb.PageController do
  use SevenStoriesClubWeb, :controller
  alias SevenStoriesClub.Account

  def index(conn, _params) do
    conn
    |> render("index.html", stats: Account.stats)
  end
end
