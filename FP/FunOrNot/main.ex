defmodule Solution do
  def main() do
    # Read input from standard input
    input = IO.read(:stdio, :all)

    input
    |> String.split("\n", trim: true)
    |> parse_and_solve()
  end

  defp parse_and_solve(lines) do
    # Parse the number of test cases
    [t | rest] = lines
    test_cases = parse_test_cases(String.to_integer(t), rest)

    # Process each test case and determine if it's a valid function
    results = Enum.map(test_cases, &valid_function?/1)

    # Print results
    Enum.each(results, fn result ->
      IO.puts(if result, do: "YES", else: "NO")
    end)
  end

  defp parse_test_cases(0, _lines), do: []

  defp parse_test_cases(count, lines) do
    # Parse each test case
    {test_case, remaining_lines} = parse_single_test_case(lines)
    [test_case | parse_test_cases(count - 1, remaining_lines)]
  end

  defp parse_single_test_case([n | rest]) do
    n = String.to_integer(n)
    pairs = Enum.take(rest, n) |> Enum.map(&parse_pair/1)
    {pairs, Enum.drop(rest, n)}
  end

  defp parse_pair(line) do
    [x, y] = String.split(line) |> Enum.map(&String.to_integer/1)
    {x, y}
  end

  defp valid_function?(pairs) do
    # Check if all `x` values map to exactly one `y` value
    pairs
    |> Enum.group_by(fn {x, _y} -> x end)
    |> Enum.all?(fn {_x, ys} ->
      ys |> Enum.uniq_by(fn {_x, y} -> y end) |> length() == 1
    end)
  end
end

Solution.main()
