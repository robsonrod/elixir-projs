defmodule Speedtest.Client do
  @user_url "http://speedtest.net/speedtest-config.php"

  def default_url(), do: @user_url

  def fetch_user(url) do
    url
    |> pick_up_client_from_url()
    |> fecth_client_from_data()
  end

  defp pick_up_client_from_url(url) do
    case HTTPoison.get(url, [], follow_redirect: true) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> body
      {:ok, %HTTPoison.Response{status_code: 404}} -> :erro_404
      {:error, %HTTPoison.Error{reason: reason}} -> reason
    end
  end

  defp fecth_client_from_data(data) do
    %{"settings" => %{"client" => parsed}} =
      data
      |> XmlToMap.naive_map()

    %Speedtest.ClientInfo{
      country: parsed["-country"],
      ip: parsed["-ip"],
      isp: parsed["-isp"],
      ispdlavg: String.to_integer(parsed["-ispdlavg"]),
      isprating: String.to_float(parsed["-isprating"]),
      ispulavg: String.to_integer(parsed["-ispulavg"]),
      lat: String.to_float(parsed["-lat"]),
      loggedin: String.to_integer(parsed["-loggedin"]),
      lon: String.to_float(parsed["-lon"]),
      rating: String.to_integer(parsed["-rating"])
    }
  end
end
