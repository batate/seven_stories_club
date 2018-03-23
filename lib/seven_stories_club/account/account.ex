defmodule SevenStoriesClub.Account do
  defstruct [:id, :email, :username, :password]
  alias __MODULE__
  def authenticate(username, password) do
    {:ok, account1()}
  end

  def create(attributes) do
    {:ok, account1()}
  end

  def find_all() do
    [
      account1(),
      account2()
    ]
  end

  def find_by_name(name) do
    account1()
  end

  defp account1() do
    %Account{id: 1, username: "Grace Hopper", email: "grace@example.com"}
  end

  defp account2() do
    %Account{id: 2, username: "Alan Turing", email: "alan@example.com"}
  end

end
