defmodule Solution do
  def main do
    IO.gets("") |> String.trim() |> String.to_integer() |> fib_sum() |> IO.puts()
  end

  @spec fib_sum(integer) :: integer
  defp fib_sum(n) do
    case n do
      1 -> 0
      2 -> 1
      _ -> fib_sum(n - 2) + fib_sum(n - 1)
    end
  end
end

Solution.main()
