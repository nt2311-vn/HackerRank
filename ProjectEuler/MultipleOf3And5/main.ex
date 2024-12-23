defmodule Solution do
  def main do
    _ = IO.gets("")

    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.each(&IO.puts/1)
  end

  @spec sum_peform(integer) :: integer
  def sum_peform(n) do
    1..(n - 1)
    |> Enum.reduce(0, fn x, acc ->
      if rem(x, 3) == 0 or rem(x, 5) == 0, do: x + acc, else: acc
    end)
    |> IO.puts()
  end
end

Solution.main()
