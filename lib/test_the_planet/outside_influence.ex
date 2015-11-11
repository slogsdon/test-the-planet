defmodule TestThePlanet.OutsideInfluence do
  @moduledoc """
  A look around options when dealing with external APIs.
  """

  defmodule API do
    @moduledoc """
    The external API which retrieves the caller's public IP. *Consider this
    module outside of your control.*
    """

    @doc """
    Calls an endpoint on the ipify.org API.
    """
    @spec call(String.t) :: {atom, term}
    def call(endpoint) do
      request = {"https://api.ipify.org" <> endpoint |> to_char_list, []}
      :httpc.request(:get, request, [], [])
    end
  end

  # alias __MODULE__.API

  @doc """
  An external web service call.

  Real world code often includes external libraries, APIs, etc. that makes
  testing properly an obscure task.
  """
  @spec service :: {atom, term}
  def service(api \\ API) do
    api.call("/")
  end

  @doc """
  Conditional wrapper around `service/0`.

  This function depends on an application environment variable
  (`:conditional_service_flag`) to control runtime execution, typically set
  using `Mix.Config`.
  """
  @spec conditional_service :: {atom, term} | nil
  def conditional_service do
    flag = Application.get_env(:test_the_planet, :conditional_service_flag, true)
    if flag do
      service
    else
      nil
    end
  end
end
