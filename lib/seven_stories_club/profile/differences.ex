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
end