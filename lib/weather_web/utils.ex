defmodule WeatherWeb.Utils do
  # DateTime functions
  def current_dt(form, timezone) do
    timezone
    |> get_current_dt()
    |> format_dt(form)
  end

  def weather_dt(form, unix_seconds) do
    unix_seconds
    |> get_weather_dt()
    |> format_dt(form)
  end

  defp get_current_dt(timezone) do
    case DateTime.now(timezone, Tzdata.TimeZoneDatabase) do
      {:ok, dt} -> dt
      error -> error
    end
  end

  defp get_weather_dt(unix_seconds) do
    DateTime.from_unix!(unix_seconds)
  end

  defp format_dt(dt, form) do
    Calendar.strftime(dt, format(form))
  end

  defp format(form) do
    case form do
      :day -> "%A"
      :date -> "%A, %B %d, %Y"
      :short_date -> "%m/%d"
      :time -> "%I:%M %p"
    end
  end

  # Temperature functions
  def temp_conversion(conversion, kelvin) do
    case conversion do
      :f -> round((kelvin - 273.15) * 1.8 + 32)
      :c -> round(kelvin - 273.15)
    end
  end
end
