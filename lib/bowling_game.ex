defmodule BowlingGame do
  def calculate(rolls) do
    calculate(rolls, 0)
  end

  defp calculate([], score) do
    score
  end

  defp calculate([roll, second, third | []], score) do
    score + roll + second + third
  end

  defp calculate([10, second, third | rolls], score) do
    calculate([second, third] ++ rolls, score + 10 + second + third)
  end

  defp calculate([first, second, third | rolls], score) when first + second == 10 do
    calculate([third] ++ rolls, score + 10 + third)
  end

  defp calculate([first, second | rolls], score) do
    calculate(rolls, score + first + second)
  end

  def get_score(rolls) do
    get_score(rolls, [])
  end

  defp get_score([x, y], frameScores) do
    (frameScores ++ [x + y])
    |> Enum.slice(0, 10)
    |> Enum.sum()
  end

  defp get_score([firstRoll, secondRoll, thirdRoll | tail], frameScores) do
    case {firstRoll, secondRoll, thirdRoll} do
      {10, _, _} -> get_score([secondRoll, thirdRoll] ++ tail, frameScores ++ [10 + secondRoll + thirdRoll])
      {x, y, _} when x + y == 10 -> get_score([thirdRoll] ++ tail, frameScores ++ [10 + thirdRoll])
      {_, _, _} -> get_score([thirdRoll] ++ tail, frameScores ++ [firstRoll + secondRoll])
    end
  end
end
