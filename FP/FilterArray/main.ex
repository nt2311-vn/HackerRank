defmodule Solution do
  def main do
    limit = IO.gets("") |> String.trim() |> String.to_integer()

    list =
      IO.stream(:stdio, :line) |> Stream.map(&String.trim/1) |> Stream.map(&String.to_integer/1)

    Enum.filter(list, fn x -> x < limit end) |> Enum.each(fn x -> IO.puts(x) end)
  end
end

Solution.main()
