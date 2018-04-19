defmodule SevenStoriesClub.Profile do
  defstruct [
    :id,
    :age,
    :ethnicity,
    :gender,
    :political_affiliation,
    :user_id,
    :income,
    :education_level
  ]

  alias __MODULE__

  def create(attributes) do
    {:ok, profile1()}
  end

  def find(id) do
    {:ok, profile1()}
  end

  def update(id, attributes) do
    {:ok, profile1()}
  end

  defp profile1() do
    %Profile{
      id: 1,
      age: 27,
      ethnicity: "Other",
      gender: "female",
      political_affiliation: "Democrat",
      user_id: 1,
      income: 10_000_000_000_000_000_000,
      education_level: "Bachelors of Science in Math"
    }
  end
end
