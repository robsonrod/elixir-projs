defmodule Speedtest.UserTest do
  use ExUnit.Case
  doctest Speedtest.Client

  test "fetch servers from url" do
    assert Speedtest.Client.fetch_user(Speedtest.Client.default_url()) != nil
  end
end
