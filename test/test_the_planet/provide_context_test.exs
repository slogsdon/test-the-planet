defmodule TestThePlanet.ProvideContextTest do
  use ExUnit.Case, async: true
  import TestThePlanet.OutsideInfluence
  alias __MODULE__.TestAPI
  alias TestThePlanet.ProvideContext.Response

  setup do
    response = service(TestAPI)
      |> Response.from_raw
    {:ok, %{response: response}}
  end

  test "service/1 with TestAPI 1", %{response: response} do
    refute response == nil
    assert response.status == '429'
  end

  test "service/1 with TestAPI 2", %{response: response} do
    assert response.body == '74.142.61.86'
  end

  test "service/1 with TestAPI 3" do
    result = service(TestAPI)

    assert result |> elem(0) == :ok
  end

  defmodule TestAPI do
    @spec call(String.t) :: {atom, term}
    def call("/") do
      {:ok, {{'HTTP/3', '429', 'I am a teapot'}, [], '74.142.61.86'}}
    end
  end
end
