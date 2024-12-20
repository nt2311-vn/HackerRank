defmodule Solution do
  def main do
    list =
      IO.stream(:stdio, :line) |> Stream.map(&String.trim/1) |> Stream.map(&String.to_integer/1)

    list
    |> Enum.with_index()
    |> Enum.reduce([], fn {val, idx}, acc ->
      cond do
        rem(idx, 2) != 0 -> [val | acc]
        true -> acc
      end
    end)
    |> Enum.reverse()
    |> Enum.each(fn x -> IO.puts(x) end)
  end
end

Solution.main()
