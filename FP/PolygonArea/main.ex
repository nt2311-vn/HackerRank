defmodule Solution do
  def main do
    _ = IO.gets("") |> String.trim() |> String.to_integer()

    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Enum.reduce([], fn x, acc ->
      cond do
        x == nil -> acc
        true -> [x |> string_to_tuple() | acc]
      end
    end)
    |> Enum.reverse()
    |> Enum.map(fn {x, y} -> {String.to_integer(x), String.to_integer(y)} end)
    |> cal_area()
    |> IO.puts()
  end

  @spec string_to_tuple(String.t()) :: tuple
  defp string_to_tuple(line) do
    line |> String.split(" ", trim: true) |> Enum.to_list() |> List.to_tuple()
  end

  @spec cal_area(list(integer)) :: float
  defp cal_area(points) do
    closed_points = points ++ [hd(points)]

    sum =
      closed_points
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce(0.0, fn [{x1, y1}, {x2, y2}], acc ->
        acc + (x1 * y2 - x2 * y1)
      end)

    abs(sum) / 2
  end
end

Solution.main()
