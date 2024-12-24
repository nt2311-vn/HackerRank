defmodule PascalTriangle do
  def main do
    n = IO.gets("") |> String.trim() |> String.to_integer()

    generate_triangle(n, [])
    |> Enum.each(&print_row/1)
  end

  defp generate_triangle(0, acc), do: Enum.reverse(acc)

  defp generate_triangle(n, acc) do
    new_row =
      case acc do
        [] -> [1]
        [prev_row | _] -> generate_next_row(prev_row)
      end

    generate_triangle(n - 1, [new_row | acc])
  end

  defp generate_next_row(prev_row) do
    [1] ++ calculate_in_between(prev_row) ++ [1]
  end

  defp calculate_in_between([_]), do: []

  defp calculate_in_between([x, y | tail]) do
    [x + y | calculate_in_between([y | tail])]
  end

  defp print_row(row) do
    row
    |> Enum.join(" ")
    |> IO.puts()
  end
end

PascalTriangle.main()
