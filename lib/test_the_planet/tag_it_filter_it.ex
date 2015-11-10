defmodule TestThePlanet.TagItFilterIt do
  @moduledoc """
  Tags can be useful for grouping certain tests. Filters are usefult for running
  specific tags.

  Some libraries and applications will have a set of behaviours and protocols,
  allowing them to be extended with a defined contract. Those libraries and
  applications will want to test the contract itself and the functions that
  depend on it, There will be times when a unit test will not be enough, so the
  developer will often use integration testing to improve the tests covering the
  project.

  This is a perfect use case for tags on tests. It will allow the developer mark
  certain tests (or test modules) as being a part of a group, like
  `:integration`. Filters allow a set of default groups to be ran when `mix
  test` is called, but it will also allow additional groups to be ran when
  desired.
  """

  use Behaviour

  @doc "A simple callback"
  @callback call(String.t) :: String.t
end

defmodule TestThePlanet.TagItFilterIt.ServiceA do
  @moduledoc "Returns the given string"
  @behaviour TestThePlanet.TagItFilterIt
  def call(str), do: str
end

defmodule TestThePlanet.TagItFilterIt.ServiceB do
  @moduledoc "Reverses the given string"
  @behaviour TestThePlanet.TagItFilterIt
  def call(str), do: str |> String.reverse
end
