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
    |> cal_perimeter()
    |> IO.puts()
  end

  @spec string_to_tuple(String.t()) :: tuple
  defp string_to_tuple(line) do
    line |> String.split(" ", trim: true) |> Enum.to_list() |> List.to_tuple()
  end

  @spec cal_perimeter(list(integer)) :: float
  defp cal_perimeter(points) do
    closed_points = points ++ [hd(points)]

    closed_points
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0.0, fn [{x1, y1}, {x2, y2}], acc ->
      distance = :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2))
      acc + distance
    end)
  end
end

Solution.main()
