defmodule Speedtest.ServerTest do
  use ExUnit.Case
  doctest Speedtest.Server

  test "fetch servers from url" do
    expected = %Speedtest.ServerInfo{
      cc: "BR",
      country: "Brazil",
      host: "velocimetro-bsb.virtua.com.br:8080",
      id: 15014,
      lat: -15.781,
      long: -47.9196,
      name: "Brasilia",
      sponsor: "Claro net vírtua",
      url: "http://velocimetro-bsb.virtua.com.br:8080/speedtest/upload.php"
    }

    first = Enum.at(Speedtest.Server.fetch_servers(Speedtest.Server.default_url()), 0)
    assert(first == expected)
  end
end
