defmodule Weather.OpenWeatherMap.Daily.Temperature do
  defstruct ~w[min max day morn night eve]a

  def new(data) do
    %__MODULE__{
      min: data.min,
      max: data.max,
      day: data.day,
      night: data.night,
      eve: data.eve,
      morn: data.eve
    }
  end
end
