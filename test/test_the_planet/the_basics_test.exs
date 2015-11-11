defmodule TestThePlanet.TheBasicsTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  # import ExUnit.CaptureLog

  alias TestThePlanet.TheBasics
  import TheBasics
  doctest TheBasics

  test "raise" do
    assert_raise File.Error, fn ->
      TheBasics.reader!("nonexistent/file")
    end

    assert_raise File.Error, ~r/no such file/, fn ->
      TheBasics.reader!("nonexistent/file")
    end
  end

  test "receive" do
    message = {:do_thing, "arg"}
    send_message(self, message)
    assert_receive ^message
  end

  test "capture_io" do
    assert capture_io(fn ->
      inspect_data [1,2,3]
    end) == "[1, 2, 3]\n"
  end

  # test "capture_log" do
  #   message = "hello"
  #   assert capture_log(fn ->
  #     log(message)
  #   end) == message
  # end
end
