defmodule Solution do
  def main do
    time = IO.gets("") |> String.trim() |> String.to_integer()

    list =
      IO.stream(:stdio, :line) |> Stream.map(&String.trim/1) |> Stream.map(&String.to_integer/1)

    repeat_list(time, list)
  end

  @spec repeat_list(integer, list) :: nil
  defp repeat_list(n, list) do
    list
    |> Enum.each(fn x -> repeat(n, x) end)
  end

  @spec repeat(integer, integer) :: nil
  defp repeat(n, num) do
    case n do
      0 ->
        nil

      _ ->
        IO.puts(num)
        repeat(n - 1, num)
    end
  end
end

Solution.main()
