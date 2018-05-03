defmodule SevenStoriesClub.ListDifferences do
  def attribute_difference(list) do
     list 
     |> Enum.filter(&( &1 != "NA" )) 
     |> Enum.uniq 
     |> Enum.count
  end
end