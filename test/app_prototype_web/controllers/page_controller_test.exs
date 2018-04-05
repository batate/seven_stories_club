defmodule SevenStoriesClubWeb.PageControllerTest do
  use SevenStoriesClubWeb.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "We have"
    assert html_response(conn, 200) =~ "Seven Stories Club"
  end
end
