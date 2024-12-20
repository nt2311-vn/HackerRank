defmodule Solution do
  def main do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.map(fn x -> if x < 0, do: -x, else: x end)
    |> Enum.each(fn x -> IO.puts(x) end)
  end
end

Solution.main()
