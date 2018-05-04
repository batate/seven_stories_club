defmodule SevenStoriesClubWeb.DifferencesTest do
  use ExUnit.Case, async: true
  alias SevenStoriesClub.Differences
  alias SevenStoriesClub.ListDifferences
  
  test "a list of same attributes returns a difference of 1" do
    assert ListDifferences.attribute_difference(["female", "female", "female"]) == 0
  end
  
  test "a list of males and females and an NA should return a difference of 1" do
    assert ListDifferences.attribute_difference(["male", "male", "female", "NA"]) == 1
  end
  
  test "three users with ages computes attribute difference" do
    users = [
      %{age: 40, gender: "male"},
      %{age: 40, gender: "female"},
      %{age: 23, gender: "NA"}
    ]
    assert ListDifferences.difference_score_for_key(users, :age) == 1
    assert ListDifferences.difference_score_for_key(users, :gender) == 1
  end

  test "three users with ages computes attribute difference for single list" do
    users = [
      %{age: 40, gender: "male"},
      %{age: 40, gender: "female"},
      %{age: 23, gender: "NA"}
    ]
    assert ListDifferences.difference_score_for_single_list(users) == 2
  end

  test "an empty list returns a difference of 0" do
    assert ListDifferences.attribute_difference([]) == 0
  end
  
  test "two profile lists compute difference score with list_difference" do
    assert ListDifferences.list_score( list3() ) == 3
    assert ListDifferences.list_score( list4() ) == 4
  end

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
  
  test "two profiles compute difference score" do
    assert Differences.user_difference_score( profile1(), profile2() ) == 2
    assert Differences.user_difference_score( profile2(), profile3() ) == 0
  end
  
  test "two lists of profiles compute difference score" do
    assert Differences.list_score( list1() ) == 3
    assert Differences.list_score( list2() ) == 4
  end
  
  def profile1() do
    %{ ethnicity: "white", gender: "Male", age: "14to24" }
  end

  def profile2() do
    %{ ethnicity: "african american", gender: "Female", age: "14to24" }
  end
  
  def profile3() do
    %{ ethnicity: "african american", gender: "Female", age: "NA" }
  end
  
  def profile4() do
    %{ ethnicity: "african american", gender: "Male", age: "50-99" }
  end
    
  def list1() do 
    [{profile1(), profile2()}, {profile3(), profile4()}]
  end
  def list2() do 
    [{profile1(), profile3()}, {profile2(), profile4()}]
  end
  def list3() do 
    [[profile1(), profile2()], [profile3(), profile4()]]
  end
  def list4() do 
    [[profile1(), profile3()], [profile2(), profile4()]]
  end

end