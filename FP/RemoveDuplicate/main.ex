defmodule Solution do
  def main do
    IO.gets("") |> String.split("", trim: true) |> Enum.uniq() |> Enum.join() |> IO.puts()
  end
end

Solution.main()
