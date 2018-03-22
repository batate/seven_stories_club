defmodule SevenStoriesClubWeb.PageController do
  use SevenStoriesClubWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
