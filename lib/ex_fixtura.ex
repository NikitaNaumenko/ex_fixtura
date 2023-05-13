defmodule ExFixtura do
  @moduledoc """
  Documentation for `ExFixtura`.
  """

  @path "test/support/fixtures"

  for fixture <- File.ls!(@path) do
    [name, _] = fixture |> String.split(".")

    def unquote(String.to_atom(name))() do
      {:ok, fixtures} = YamlElixir.read_from_file(@path <> "/" <> unquote(fixture))

      fixtures
    end
  end

  # [type, rest] = line |> String.split("\t") |> Enum.map(&String.strip(&1))
  # extensions = String.split(rest, ~r/,\s?/)

  # def exts_from_type(unquote(type)), do: unquote(extensions)
  # def type_from_ext(ext) when ext in unquote(extensions), do: unquote(type)
  def fixtures() do
    path = "test/support/fixtures"

    File.ls!(path)
    |> Enum.map(fn x -> String.split(x, ".") |> hd() end)
  end
end
