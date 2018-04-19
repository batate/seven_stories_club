defmodule SevenStoriesClub.Meeting do
  defstruct [
    :id,
    :location,
    :time,
    :from_profile_id,
    :to_profile_id,
    :code
  ]

  alias __MODULE__

  def create(from_profile_id, time, location) do
    {:ok, meeting1()}
  end

  def join(code, profile_id) do
    {:ok, meeting1()}
  end

  def add_profile(meeting, profile_id) do
    {:ok, meeting1()}
  end

  defp meeting1() do
    %{}
  end
end
