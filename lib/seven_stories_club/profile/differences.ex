defmodule SevenStoriesClub.Differences do
  def attribute_difference("NA", _value) do
    0
  end
  
  def attribute_difference(_value, "NA") do
    0
  end
  
  def attribute_difference(value, value) do
    0
  end
  
  def attribute_difference(_, _) do
    1
  end
  
  def user_difference_score(u1, u2) do
    Enum.zip(user_attribute_list(u1),user_attribute_list(u2))
    |> Enum.map( fn( { {_key1, value1}, {_key2, value2} } ) ->
      attribute_difference( value1, value2 )
    end ) 
    |> Enum.sum
  end
  
  def user_attribute_list(user) do
    user
    |> Enum.map( fn( {key, value} ) -> { key, value } end )
    |> Enum.sort
  end
  
  def list_score(list1) do
    list1
    |> Enum.map( fn({profile1, profile2}) -> user_difference_score(profile1,profile2) end)
    |> Enum.sum
  end
  
end