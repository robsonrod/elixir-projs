defmodule Speedtest.UserTest do
  use ExUnit.Case
  doctest Speedtest.User

  test "fetch servers from url" do
    assert Speedtest.User.fetch_user(Speedtest.User.default_url()) != nil
  end
end
