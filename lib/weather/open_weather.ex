defmodule Weather.OpenWeatherMap do
  alias Weather.OpenWeatherMap.{
    Client,
    Data,
    WeatherData,
    GeoData
  }

  def request(location) do
    Data.new(location)
    |> get_coordinates()
    |> get_weather()
    |> mapper()
  end

  def get_coordinates(%Data{location: location} = data) do
    case Client.geo(location) do
      {:ok, %Tesla.Env{body: []}} ->
        struct!(data, %{valid?: false})

      {:ok, %Tesla.Env{body: [body]}} ->
        struct!(data, %{geo: body})

      _ ->
        struct!(data, %{valid?: false})
    end
  end

  def get_weather(%Data{valid?: false} = data) do
    data
  end

  def get_weather(%Data{geo: geo, valid?: true} = data) do
    case Client.one_call(geo.lat, geo.lon) do
      {:ok, %Tesla.Env{body: body}} ->
        struct!(data, %{weather: body})

      _ ->
        struct!(data, %{valid?: false})
    end
  end

  def mapper(%Data{valid?: false} = data) do
    data
  end

  def mapper(%Data{geo: geo, weather: weather} = data) do
    geo = GeoData.new(geo)
    weather = WeatherData.new(weather)
    struct!(data, %{geo: geo, weather: weather})
  end
end
