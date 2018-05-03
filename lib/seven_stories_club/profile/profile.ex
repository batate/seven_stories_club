defmodule SevenStoriesClub.Profile.Profile do
  @moduledoc """
  The anonymous user profile (which may be de-anonymized by connection to a user
  profile).
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias SevenStoriesClub.Coherence.User

  schema "profiles" do
    field(:age, :integer)
    field(:ethnicity, :string)
    field(:gender, :string)
    field(:political_affiliation, :string)
    field(:education_level, :string)

    belongs_to(:user, User)
  end

  def changeset(profile, params \\ %{}) do
    profile
    |> cast(params, [:age, :ethnicity, :gender, :political_affiliation, :education_level])
    |> validate_inclusion(:age, 1..400)
  end
end
