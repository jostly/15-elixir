defmodule HaarTest do
  use ExUnit.Case

  test "transform [1, 1]" do
    assert Haar.transform([1, 1]) == [1, 0]
  end

  test "transform [8, 5]" do
    assert Haar.transform([8, 5]) == [6.5, 1.5]
  end

  test "transform [8, 5, 7, 3]" do
  	assert Haar.transform([8, 5, 7, 3]) == [5.75, 0.75, 1.5, 2]
  end

  test "transform [9, 7, 3, 5, 6, 10, 2, 6] -> [6, 0, 2, 2, 1, -1, -2, -2]" do
  	assert Haar.transform([9, 7, 3, 5, 6, 10, 2, 6]) == [6, 0, 2, 2, 1, -1, -2, -2]
  end

  # TODO: next exercise
  #test "reconstruct two elements" do
  #  assert Haar.reconstruct([1, 0]) == [1, 1]
  #  assert Haar.reconstruct([6.5, 1.5]) == [8, 5]
  #end

  #test "reconstruct four elements" do
  #  assert Haar.reconstruct([5.75, 0.75, 1.5, 2]) == [8, 5, 7, 3]
  #end
end
