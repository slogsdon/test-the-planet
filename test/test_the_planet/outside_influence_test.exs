defmodule TestThePlanet.OutsideInfluenceTest do
  use ExUnit.Case, async: true
  import TestThePlanet.OutsideInfluence
  alias __MODULE__.TestAPI

  @moduletag :integration


  # @tag timeout: 3_000
  test "service/0" do
    result = service()

    assert result |> elem(0) == :ok
  end

  test "service/1 with TestAPI" do
    result = service(TestAPI)

    assert result |> elem(0) == :ok
  end

  defmodule TestAPI do
    @spec call(String.t) :: {atom, term}
    def call("/") do
      {:ok}
    end
  end
end
