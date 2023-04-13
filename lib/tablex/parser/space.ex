defmodule Tablex.Parser.Space do
  @moduledoc """
  Helper parser for parsing space, newline or end of word.
  """
  import NimbleParsec

  def space(combinitor \\ empty()) do
    combinitor
    |> concat(" " |> string() |> times(min: 1) |> ignore())
  end

  def optional_space(combinitor \\ empty()) do
    combinitor
    |> concat(space() |> optional())
  end

  def newline(combinitor \\ empty()) do
    combinitor
    |> concat(string("\n") |> ignore())
  end

  def eow do
    choice([
      string(" "),
      string("\n"),
      eos()
    ])
  end
end