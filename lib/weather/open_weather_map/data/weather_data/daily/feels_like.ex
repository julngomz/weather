defmodule Weather.OpenWeatherMap.Daily.FeelsLike do
  defstruct ~w[day morn eve night]a

  def new(data) do
    %__MODULE__{
      day: data.day,
      morn: data.day,
      eve: data.eve,
      night: data.night
    }
  end
end
