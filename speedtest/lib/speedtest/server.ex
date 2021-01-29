defmodule Speedtest.Server do
  alias Speedtest.ServerInfo
  @speedtest_servers_url "http://www.speedtest.net/speedtest-servers-static.php"

  def default_url, do: @speedtest_servers_url

  def fetch_servers(url) do
    url
    |> pick_up_server_list_from_url()
    |> parser_servers_list()
  end

  defp pick_up_server_list_from_url(url) do
    case HTTPoison.get(url, [], follow_redirect: true) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        :erro_404

      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end

  defp parser_servers_list(data) do
    %{"settings" => %{"servers" => %{"server" => servers_info}}} = XmlToMap.naive_map(data)

    servers_info
    |> Enum.map(fn x ->
      %ServerInfo{
        cc: x["-cc"],
        country: x["-country"],
        host: x["-host"],
        id: String.to_integer(x["-id"]),
        lat: String.to_float(x["-lat"]),
        long: String.to_float(x["-lon"]),
        name: x["-name"],
        sponsor: x["-sponsor"],
        url: x["-url"]
      }
    end)
  end
end
