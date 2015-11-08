defmodule TestThePlanet.ProvideContext do
  @moduledoc """
  Giving context to tests.

  Writing the same setup for all the tests for a module leaves a lot of
  redundant code in your tests. What happens if the setup code needs to change?
  Each and every copy needs to be updated!

  This is where setup callbacks come into play. ExUnit has this ability, but its
  method for passing a context around is different from most object-oriented
  testing frameworks.
  """

  defmodule Response do
    @moduledoc """
    A simple struct to wrap a response from `:httpc.request`.
    """

    @type t :: %__MODULE__{
      version: :httpc.http_version,
      status: :httpc.status_code,
      reason: :httpc.reason_phrase,
      headers: :httpc.headers,
      body: :httpc.body
    }
    defstruct version: nil,
              status: nil,
              reason: nil,
              headers: nil,
              body: nil

    @doc """
    Converts a response tuple from `:httpc.request` to `#{__MODULE__}`.
    """
    @spec from_raw({atom, {:httpc.status_line, :httpc.headers, :httpc.body}}) :: t
    def from_raw({:ok, {{version, status, reason}, headers, body}}) do
      __MODULE__ |> struct(
        version: version,
        status: status,
        reason: reason,
        headers: headers,
        body: body
      )
    end
    def from_raw(_) do
      nil
    end
  end
end
