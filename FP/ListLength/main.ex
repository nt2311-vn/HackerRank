defmodule Solution do
  def main do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.reduce(0, fn x, acc -> if x == nil, do: acc, else: acc + 1 end)
    |> IO.puts()
  end
end

Solution.main()
