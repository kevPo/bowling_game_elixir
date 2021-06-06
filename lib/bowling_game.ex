defmodule BowlingGame do
  def get_score(rolls), do: get_score(rolls, 0)
  defp get_score([], score), do: score

  defp get_score([first, second, third | []], score) do
    first + second + third + score
  end

  defp get_score([10, second, third | rolls], score) do
    get_score([second, third] ++ rolls, score + 10 + second + third)
  end

  defp get_score([first, second, third | rolls], score) when first + second == 10 do
    get_score([third] ++ rolls, score + 10 + third)
  end

  defp get_score([first, second | rolls], score) do
    get_score(rolls, score + first + second)
  end
end
