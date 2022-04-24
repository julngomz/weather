defmodule Weather.OpenWeatherMap.Daily.Celestial do
  defstruct ~w[rise rise_img set set_img]a

  def new(data) do
    %__MODULE__{
      rise: data.rise,
      rise_img: data.rise_img,
      set: data.set,
      set_img: data.set_img
    }
  end
end
