defmodule Day01 do
  def inputFile() do
    "Day01Input.txt"
  end

  def readInput() do
    case File.read(inputFile()) do
      {:ok, content} -> content
      {:error, reason} -> raise reason
    end
  end

  def calcLevel(s, acc) when s == "" do
    acc
  end

  def calcLevel(s) do
    pos = s |> String.codepoints |> Enum.count(&(&1 == "("))
    neg = s |> String.codepoints |> Enum.count(&(&1 == ")"))
    pos - neg
  end

  def day01Part1 do
    readInput()
    |> calcLevel()
  end

  def calcBasementEnter(s, level, charPos) do
    if level == -1 do
      charPos
    else
      case String.at(s, 0) do
        "(" -> calcBasementEnter(String.slice(s, 1, String.length(s)), level + 1, charPos + 1)
        ")" -> calcBasementEnter(String.slice(s, 1, String.length(s)), level - 1, charPos + 1)
      end
    end
  end

  def day01Part2 do
    readInput()
    |> calcBasementEnter(0, 0)
  end
end

Day01.day01Part1()
|> IO.puts()

Day01.day01Part2()
|> IO.puts()
