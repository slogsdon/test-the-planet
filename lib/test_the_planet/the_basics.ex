defmodule TestThePlanet.TheBasics do
  @moduledoc """
  A look around the bascs with ExUnit's assertions.

  `ExUnit.Assertions` and `ExUnit.DocTest` may be good resources.
  """

  @doc """
  Adds two numbers.

  #### Examples

      iex> adder(1, 2)
      3

      iex> adder(1.1, 2.2)
      3.3000000000000003
  """
  @spec adder(number, number) :: number
  def adder(a, b) do
    a + b
  end

  @doc ~S"""
  Reads from a file.

  #### Examples

      iex> reader("./test/fixtures/hello")
      {:ok, "hello\n"}

      iex> reader(".")
      {:error, :eisdir}
  """
  @spec reader(Path.t) :: {:ok, binary} | {:error, :file.posix}
  def reader(file) do
    File.read(file)
  end

  @doc ~S"""
  Reads from a file. Raises exception on error.

  #### Examples

      iex> reader!("./test/fixtures/hello")
      "hello\n"

      iex> reader!(".")
      ** (File.Error) could not read file .: illegal operation on a directory
  """
  @spec reader!(Path.t) :: binary | no_return
  def reader!(file) do
    File.read!(file)
  end

  @doc """
  Sends a message to a process.

  #### Examples

      iex> send_message(self, {:do_thing, "arg"})
      iex> receive do m -> m end
      {:do_thing, "arg"}
  """
  @spec send_message(pid, term) :: any
  def send_message(pid, message) do
    pid |> send(message)
  end

  @doc """
  Inspects data to console.
  """
  @spec log(any) :: any
  def inspect_data(data) do
    IO.inspect(data)
  end

  @doc """
  Logs via `Logger`.
  """
  @spec log(String.t) :: any
  def log(message) do
    require Logger
    Logger.info(message)
  end
end
