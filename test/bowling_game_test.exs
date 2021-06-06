defmodule BowlingGameTest do
  use ExUnit.Case
  doctest BowlingGame

  test "all gutters returns 0" do
    rolls = replicate(20, 0)
    assert BowlingGame.get_score(rolls) == 0
  end

  test "non-marking returns sum" do
    rolls = replicate(20, 1)
    assert BowlingGame.get_score(rolls) == 20
  end

  test "spare adds bonus" do
    rolls = [3, 7, 3] ++ replicate(17, 0)
    assert BowlingGame.get_score(rolls) == 16
  end

  test "strike adds bonus" do
    rolls = [10, 2, 2] ++ replicate(16, 0)
    assert BowlingGame.get_score(rolls) == 18
  end

  test "perfect game" do
    rolls = replicate(12, 10)
    assert BowlingGame.get_score(rolls) == 300
  end

  def replicate(n, x), do: for _ <- 1..n, do: x
end
