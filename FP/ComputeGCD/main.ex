defmodule Solution do
  def main do
    list =
      IO.gets("")
      |> String.split(" ", trim: true)

    a = List.first(list)
    b = List.last(list)

    Integer.gcd(a |> String.to_integer(), b |> String.to_integer()) |> IO.puts()
  end
end

Solution.main()
