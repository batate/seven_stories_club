defmodule SevenStoriesClub.Profile do
  defstruct [:id, :age, :ethnicity, :gender, :political_party, :account_id, :income, :education_level]
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
    %Profile{id: 1, age: 27, ethnicity: "Other", gender: "female", political_party: "Democrat", account_id: 1, income: 10000000000000000000, education_level: "Bachelors of Science in Math"}
  end
end
