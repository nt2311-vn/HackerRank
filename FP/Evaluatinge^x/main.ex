defmodule Solution do
  def main do
    nums = IO.gets("") |> String.trim() |> String.to_integer()

    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_float/1)
    |> Enum.take(nums)
    |> Enum.map(&compute_exp(&1))
    |> Enum.each(&IO.puts/1)
  end

  defp compute_exp(n) do
    0..9
    |> Enum.reduce(0, fn x, acc -> acc + :math.pow(n, x) / factorial(x) end)
    |> Float.round(4)
  end

  defp factorial(0), do: 1
  defp factorial(n), do: n * factorial(n - 1)
end

Solution.main()
