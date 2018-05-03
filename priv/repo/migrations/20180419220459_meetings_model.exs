defmodule SevenStoriesClub.Repo.Migrations.MeetingsModel do
  use Ecto.Migration

  def change do
    # meetings table
    create table(:meetings) do
      add :location, :string
      add :time, :utc_datetime
      add :code, :string
    end

    # through table
    create table(:meetings_profiles) do
      add :meeting_id, references(:meetings, on_delete: :delete_all)
      add :profile_id, references(:profiles, on_delete: :nilify_all)
    end
 end
end
