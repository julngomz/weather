defmodule Weather.OpenWeatherMap.Utils do
  def dt_to_datetime(dt) do
    DateTime.from_unix!(dt)
  end

  def mapper([item | []], module) do
    apply(module, :new, [item])
  end

  def mapper(list, module) do
    for item <- list do
      apply(module, :new, [item])
    end
  end
end
