defmodule Weather.OpenWeatherMap.WeatherData do
  import Weather.OpenWeatherMap.Utils

  alias Weather.OpenWeatherMap.Daily

  defstruct ~w[lat lon timezone timezone_offset daily]a

  def new(data) do
    %__MODULE__{
      lat: data.lat,
      lon: data.lon,
      timezone: data.timezone,
      timezone_offset: data.timezone_offset,
      daily: mapper(data.daily, Daily)
      # alerts: mapper(data.alerts, Alert)
    }
  end
end
