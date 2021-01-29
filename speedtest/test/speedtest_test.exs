defmodule SpeedtestTest do
  use ExUnit.Case
  doctest Speedtest

  test "greets the world" do
    assert Speedtest.hello() == :world
  end
end
