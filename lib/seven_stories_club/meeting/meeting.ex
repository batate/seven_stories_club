defmodule SevenStoriesClub.Meeting.Meeting do
  @moduledoc """
  Database model for meetings
  """

  use Ecto.Schema

  alias SevenStoriesClub.Profile.Profile

  schema "meetings" do
    field(:location, :string)
    field(:time, :utc_datetime)
    field(:code, :string)

    many_to_many(:profiles, Profile, join_through: "meetings_profiles")
  end
end
