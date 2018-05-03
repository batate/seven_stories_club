defmodule SevenStoriesClub.ListDifferences do
  def attribute_difference(list) do
    list 
    |> Enum.filter(&( &1 != "NA" )) 
    |> Enum.filter(&( &1 != nil )) 
    |> Enum.uniq 
    |> Enum.count
    |> adjust_difference_count
  end
  
  def adjust_difference_count( 0 ), do: 0
  def adjust_difference_count( value ), do: value - 1
  
  def difference_score_for_key(list_of_maps, key) do
    list_of_maps
    |> Enum.map(&(&1[key]))
    |> attribute_difference
  end
end