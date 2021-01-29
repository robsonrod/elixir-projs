defmodule Speedtest.ServerInfo do
  defstruct cc: nil,
            country: nil,
            host: nil,
            id: 0,
            lat: 0,
            long: 0,
            name: nil,
            sponsor: nil,
            url: nil

  @type t :: %Speedtest.ServerInfo{
          cc: String.t(),
          country: String.t(),
          host: String.t(),
          id: non_neg_integer,
          lat: float,
          long: float,
          name: String.t(),
          sponsor: String.t(),
          url: String.t()
        }
end
