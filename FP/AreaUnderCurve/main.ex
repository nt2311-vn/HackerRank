defmodule Solution do
  def main do
    coefficients =
      IO.gets("")
      |> String.trim()
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    exponents =
      IO.gets("")
      |> String.trim()
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    [a, b] =
      IO.gets("")
      |> String.trim()
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    f = fn x ->
      Enum.zip(coefficients, exponents)
      |> Enum.reduce(0, fn {coef, exp}, acc ->
        acc + coef * :math.pow(x, exp)
      end)
    end

    dx = 0.001
    area = integrate(f, a, b, dx)
    volume = integrate(fn x -> :math.pi() * :math.pow(f.(x), 2) end, a, b, dx)

    IO.puts(Float.round(area, 1))
    IO.puts(Float.round(volume, 1))
  end

  defp integrate(f, a, b, dx) do
    Enum.reduce_while(Stream.iterate(a, &(&1 + dx)), 0, fn x, acc ->
      if x >= b do
        {:halt, acc}
      else
        {:cont, acc + f.(x) * dx}
      end
    end)
  end
end

Solution.main()
