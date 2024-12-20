defmodule Solution do
  def main do
    n = IO.gets("") |> String.trim() |> String.to_integer()

    Enum.reduce(0..(n - 1), [], fn x, acc ->
      cond do
        x === nil -> acc
        true -> [x | acc]
      end
    end)
    |> Enum.reverse()
    |> formatted()
  end

  @spec formatted(list) :: nil
  defp formatted(list) do
    IO.puts("[#{Enum.join(list, ",")}]")
  end
end

Solution.main()
