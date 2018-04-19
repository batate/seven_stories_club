defmodule SevenStoriesClubWeb.DifferencesTest do
  use SevenStoriesClubWeb.ConnCase, async: true
  alias SevenStoriesClub.Differences
  
  test "two different attributes return a difference score of 1" do
    assert Differences.attribute_difference( "Male", "Female" ) == 1
    assert Differences.attribute_difference( "Female", "Male" ) == 1
  end

  test "two like attributes return a difference score of 0" do
    assert Differences.attribute_difference( "Male", "Male" ) == 0
  end

  test "a NA attribute and an attribute computes a difference score of 0" do
    assert Differences.attribute_difference( "NA", "Male" ) == 0
    assert Differences.attribute_difference( "Male", "NA" ) == 0
  end
  
  test "two NA attributes computes a difference score of 0" do
    assert Differences.attribute_difference( "NA", "NA" ) == 0
  end
  
  test "two structs aggregate differences" do
    # assert Differences.struct_difference( , )
  end

end