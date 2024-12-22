defmodule Solution do
  def main do
    denote_x = IO.gets("") |> String.trim()
    denote_y = IO.gets("") |> String.trim() |> String.to_charlist()

    find_common(denote_x, denote_y) |> IO.puts()
  end

  @spec find_common(String.t(), charlist, integer) :: integer
  defp find_common(search, contents, idx \\ 0) do
    [head | tail] = contents

    cond do
      idx == length(contents) - 1 -> length(contents) - 1
      String.contains?(search, "#{head}") -> find_common(search, tail, idx + 1)
    end

    idx
  end
end

Solution.main()
