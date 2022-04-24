defmodule Weather.OpenWeatherMap.Data do
  defstruct ~w[location current weather geo valid?]a

  @spec new(String.t()) :: %__MODULE__{}
  def new(location) do
    %__MODULE__{
      location: location,
      weather: nil,
      geo: nil,
      current: nil,
      valid?: true
    }
  end
end
