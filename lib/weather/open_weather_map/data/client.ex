defmodule Weather.OpenWeatherMap.Client do
  use Tesla, only: [:get], docs: false
  alias Tesla.Middleware.{BaseUrl, JSON}

  @base_url "https://api.openweathermap.org"
  @api_key Application.get_env(:weather, :api_key)

  plug BaseUrl, @base_url
  plug JSON, engine: Poison, engine_opts: [keys: :atoms]

  def geo(location) do
    get("/geo/1.0/direct",
      query: [q: location <> ",US"] ++ [appid: @api_key]
    )
  end

  def one_call(lat, lon) do
    get("/data/2.5/onecall",
      query: [lat: lat, lon: lon, exclude: "hourly,minutely,current"] ++ [appid: @api_key]
    )
  end
end
