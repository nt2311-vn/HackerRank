defmodule Solution do
  def main do
    first_line = IO.gets("") |> String.split("", trim: true)
    second_line = IO.gets("") |> String.split("", trim: true)

    Enum.zip(first_line, second_line)
    |> Enum.map(fn {a, b} -> "#{a}#{b}" end)
    |> Enum.join()
    |> IO.puts()
  end
end

Solution.main()
