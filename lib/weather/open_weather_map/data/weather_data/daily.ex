defmodule Weather.OpenWeatherMap.Daily do
  import Weather.OpenWeatherMap.Utils

  alias Weather.OpenWeatherMap.Daily.{
    Metadata,
    Temperature,
    Celestial,
    FeelsLike,
    Wind,
    MoonPhase
  }

  defstruct ~w[dt sun moon moon_phase temp feels_like pressure humidity dew_point wind clouds uvi pop weather]a

  def new(data) do
    %__MODULE__{
      dt: data.dt,
      sun:
        Celestial.new(%{
          rise: data.sunrise,
          rise_img: "/images/sunrise.png",
          set: data.sunset,
          set_img: "/images/sunset.png"
        }),
      moon:
        Celestial.new(%{
          rise: data.moonrise,
          rise_img: "/images/moonrise.png",
          set: data.moonset,
          set_img: "/images/moonset.png"
        }),
      moon_phase: MoonPhase.new(data.moon_phase),
      temp: Temperature.new(data.temp),
      feels_like: FeelsLike.new(data.feels_like),
      pressure: data.pressure,
      humidity: data.humidity,
      dew_point: data.dew_point,
      wind:
        Wind.new(%{
          wind_speed: data.wind_speed,
          wind_deg: data.wind_deg,
          wind_gust: data.wind_gust
        }),
      clouds: data.clouds,
      uvi: data.uvi,
      pop: data.pop,
      weather: mapper(data.weather, Metadata)
    }
  end
end
