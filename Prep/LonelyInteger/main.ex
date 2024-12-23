defmodule Solution do
  def main do
    _ = IO.gets("")

    [{k, _}] =
      IO.gets("")
      |> String.split(" ", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.reduce(%{}, fn x, acc ->
        case Map.get(acc, x) do
          nil -> Map.put(acc, x, 1)
          _ -> Map.put(acc, x, 2)
        end
      end)
      |> Map.to_list()
      |> Enum.filter(fn {_, v} -> v == 1 end)

    k |> IO.puts()
  end
end

Solution.main()
