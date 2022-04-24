defmodule Weather.Session do
  defstruct ~w[current conversion data]a

  def new(session) do
    %__MODULE__{
      current: session.current,
      conversion: session.conversion,
      data: session.data
    }
  end
end
