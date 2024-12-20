defmodule Solution do
  def main do
    list =
      IO.stream(:stdio, :line) |> Stream.map(&String.trim/1) |> Stream.map(&String.to_integer/1)

    list
    |> Enum.reduce(0, fn x, acc -> if rem(x, 2) == 0, do: acc, else: x + acc end)
    |> IO.puts()
  end
end

Solution.main()
