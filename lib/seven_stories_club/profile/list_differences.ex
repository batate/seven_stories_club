defmodule SevenStoriesClub.ListDifferences do
  @moduledoc """
  This module will be used in computing a speed friending list. 
  The concept: given a list of users, break those users into tables
  Compute the difference score. 
  Create a list with high variety and high differences. 
  """

  @doc """
  The difference score gives credit for the number of different categories present. 
  No credit for "NA"
  """
  def attribute_difference(list) do
    list 
    |> Enum.filter(&( &1 != "NA" )) 
    |> Enum.filter(&( &1 != nil )) 
    |> Enum.uniq 
    |> Enum.count
    |> adjust_difference_count
  end
  
  @doc """
  The minimum difference is always zero. 
  The difference score of an empty table is zero. 
  The difference score of all the same is zero. 
  """
  def adjust_difference_count( 0 ), do: 0
  def adjust_difference_count( value ), do: value - 1
  
  @doc """
  A table is a list of users. Compute a distance score for a table. 
  """
  def table_difference_score(table) do
     table
     |> as_attribute_list
     |> Enum.group_by(&elem(&1, 0), &elem(&1, 1)) 
     |> Map.values 
     |> Enum.map(&attribute_difference/1) 
     |> Enum.sum
  end
  
  @doc """
  Takes a list of structs or maps and normalizes it to a list of all key value pairs
  as_attribute_list [%{one: 1, two: 2}, %{one: "one", two: "two"}]  
  -> [{:one, 1}, {:two, 2}, {:one, "one"}, {:two, "two"}]
  """
  def as_attribute_list(users) do
    users
    |> Enum.map(&from_struct/1)
    |> Enum.map(&Map.to_list/1) 
    |> List.flatten
  end
  
  @doc """
  It's easier to write tests that work with simple maps. 
  Piping through this function will allow us to use either maps or structs. 
  """
  def from_struct(%_{}=struct), do: Map.from_struct(struct)
  def from_struct(other), do: other
  
  def list_score(tables) do
    tables
    |> Enum.map(&table_difference_score/1)
    |> Enum.sum 
  end
  
end