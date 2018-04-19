defmodule SevenStoriesClub.Repo.Migrations.ProfileDefaults do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      modify :age, :integer, default: 0
      modify :ethnicity, :string, default: "prefer not to answer"
      modify :gender, :string, default: "prefer not to answer"
      modify :political_affiliation, :string, default: "prefer not to answer"
      modify :education_level, :string, default: "prefer not to answer"
    end
  end
end
