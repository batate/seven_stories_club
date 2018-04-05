# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SevenStoriesClub.Repo.insert!(%SevenStoriesClub.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
SevenStoriesClub.Repo.delete_all SevenStoriesClub.Coherence.User

SevenStoriesClub.Coherence.User.changeset(%SevenStoriesClub.Coherence.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> SevenStoriesClub.Repo.insert!
SevenStoriesClub.Coherence.User.changeset(%SevenStoriesClub.Coherence.User{}, %{name: "Bruce Tate", email: "bruce@rapidred.com", password: "secret", password_confirmation: "secret"})
|> SevenStoriesClub.Repo.insert!
SevenStoriesClub.Coherence.User.changeset(%SevenStoriesClub.Coherence.User{}, %{name: "Anna Sherman", email: "anna.sherman365@gmail.com", password: "secret", password_confirmation: "secret"})
|> SevenStoriesClub.Repo.insert!
SevenStoriesClub.Coherence.User.changeset(%SevenStoriesClub.Coherence.User{}, %{name: "Will Lewis", email: "will@wflewis.com", password: "secret", password_confirmation: "secret"})
|> SevenStoriesClub.Repo.insert!
