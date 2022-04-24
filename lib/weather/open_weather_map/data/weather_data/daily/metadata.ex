defmodule Weather.OpenWeatherMap.Daily.Metadata do
  defstruct ~w[id icon main description]a

  def new(data) do
    %__MODULE__{
      id: data.id,
      icon: icon_url(data.icon),
      main: data.main,
      description: data.description
    }
  end

  def icon_url(icon) do
    "http://openweathermap.org/img/wn/#{icon}@2x.png"
  end
end
