defmodule Speedtest.User do
  @user_url "http://speedtest.net/speedtest-config.php"

  def default_url(), do: @user_url

  def fetch_user(url) do
    url
    |> pick_up_client_from_url()
  end

  defp pick_up_client_from_url(url) do
    case HTTPoison.get(url, [], follow_redirect: true) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> body
      {:ok, %HTTPoison.Response{status_code: 404}} -> :erro_404
      {:error, %HTTPoison.Error{reason: reason}} -> reason
    end
  end
end
