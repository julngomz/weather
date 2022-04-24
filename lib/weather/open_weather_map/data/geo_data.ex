defmodule Weather.OpenWeatherMap.GeoData do
  defstruct ~w[name local_names lat lon country state]a

  def new(data) do
    %__MODULE__{
      name: data.name,
      local_names: data.local_names,
      lat: data.lat,
      lon: data.lon,
      country: data.country,
      state: data.state
    }
  end
end
