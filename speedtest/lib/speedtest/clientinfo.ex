defmodule Speedtest.ClientInfo do
  defstruct country: nil,
            ip: nil,
            isp: nil,
            ispdlavg: 0,
            isprating: 0,
            ispulavg: 0,
            lat: 0,
            loggedin: 0,
            lon: 0,
            rating: 0

  @type t :: %Speedtest.ClientInfo{
          country: String.t(),
          ip: String.t(),
          isp: String.t(),
          ispdlavg: integer,
          isprating: float,
          ispulavg: integer,
          lat: float,
          loggedin: non_neg_integer,
          lon: float,
          rating: float
        }
end
