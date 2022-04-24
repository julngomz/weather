defmodule Weather.OpenWeatherMap.Alert do
  defstruct ~w[sender_name event start end description]a

  def new(data) do
    %__MODULE__{
      sender_name: data.sender_name,
      event: data.event,
      start: data.start,
      end: data.end,
      description: data.description
    }
  end
end
