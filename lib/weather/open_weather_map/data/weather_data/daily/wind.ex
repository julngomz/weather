defmodule Weather.OpenWeatherMap.Daily.Wind do
  defstruct ~w[wind_speed wind_deg wind_gust]a

  def new(data) do
    %__MODULE__{
      wind_speed: data.wind_speed,
      wind_deg: data.wind_deg,
      wind_gust: data.wind_gust
    }
  end
end
