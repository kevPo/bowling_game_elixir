defmodule BowlingGame do
  def calculate(rolls) do
    calculate(rolls, 0)
  end

  defp calculate([], score) do
    score
  end

  defp calculate([roll | [second | [third | []]]], score) do
    score + roll + second + third
  end

  defp calculate([10 | [second | [third | rolls]]], score) do
    calculate([second, third] ++ rolls, score + 10 + second + third)
  end

  defp calculate([first | [second | [third | rolls]]], score) when first + second == 10 do
    calculate([third] ++ rolls, score + 10 + third)
  end

  defp calculate([first | [second | rolls]], score) do
    calculate(rolls, score + first + second)
  end

  def get_score(rolls) do
    get_score(rolls, [])
  end

  def get_score([x, y], frames) do
    (frames ++ [x + y])
    |> Enum.slice(0, 10)
    |> Enum.sum()
  end

  def get_score([head | tail], frames) do
    [firstRoll | [secondRoll | [thirdRoll | _]]] = [head | tail]

    case {firstRoll, secondRoll, thirdRoll} do
      {10, _, _} -> get_score(tail, frames ++ [10 + secondRoll + thirdRoll])
      {x, y, _} when x + y == 10 -> get_score(Enum.drop(tail, 1), frames ++ [10 + thirdRoll])
      {_, _, _} -> get_score(Enum.drop(tail, 1), frames ++ [firstRoll + secondRoll])
    end
  end
end
