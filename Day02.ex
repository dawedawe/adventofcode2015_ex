defmodule Day02 do
  def inputFile() do
    "Day02Input.txt"
  end

  def readInput() do
    case File.read(inputFile()) do
      {:ok, content} -> content
      {:error, reason} -> raise reason
    end
  end

  def parseInput(s) do
    s
    |> String.split(["\n", "\r\n"], trim: true)
    |> Enum.map(fn s -> String.split(s, "x", trim: true) end)
    |> Enum.map(fn [l, w, h] ->
      [String.to_integer(l), String.to_integer(w), String.to_integer(h)]
    end)
  end

  def calcWrappingPaper(l, w, h) do
    2 * l * w + 2 * w * h + 2 * h * l + ([l * w, w * h, h * l] |> Enum.min())
  end

  def day02Part1() do
    readInput()
    |> parseInput()
    |> Enum.map(fn [l, w, h] -> calcWrappingPaper(l, w, h) end)
    |> Enum.sum()
  end

  def calcMinPerimeter(l, w, h) do
    [2 * l + 2 * w, 2 * l + 2 * h, 2 * w + 2 * h] |> Enum.min()
  end

  def calcBow(l, w, h) do
    l * w * h
  end

  def calcRibbon(l, w, h) do
    calcMinPerimeter(l, w, h) + calcBow(l, w, h)
  end

  def day02Part2() do
    readInput()
    |> parseInput()
    |> Enum.map(fn [l, w, h] -> calcRibbon(l, w, h) end)
    |> Enum.sum()
  end
end

Day02.day02Part1()
|> IO.puts()

Day02.day02Part2()
|> IO.puts()
