defmodule SevenStoriesClub.Repo.Migrations.ProfileModel do
  use Ecto.Migration

  def change do
    # you guys can be wrong
    # - steve
    create table(:profiles) do
      add :age, :integer
      add :ethnicity, :string
      add :gender, :string
      add :political_affiliation, :string
      add :education_level, :string

      # belongs to user
      add :user_id, references(:users, on_delete: :nilify_all)
    end
  end
end
