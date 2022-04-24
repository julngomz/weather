defmodule WeatherWeb.WeatherLive do
  use WeatherWeb, :live_view

  import WeatherWeb.WeatherLive.Components
  # import WeatherWeb.Utils
  alias Weather.OpenWeatherMap, as: OWMClient
  # alias Weather.OpenWeatherMap, as: OWM

  @impl true
  def mount(_params, _session, socket) do
    data = OWMClient.request("Des Moines, IA")
    IO.inspect(data)

    {
      :ok,
      socket
      |> assign(:current, List.first(data.weather.daily))
      |> assign(:conversion, :f)
      |> assign(:data, data)
      |> assign(:tab, "Temperature")
    }
  end

  def handle_event("change_tab", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, :tab, tab)}
  end

  @impl true
  def handle_event("set-current", %{"dt" => dt}, socket) do
    IO.inspect(dt)

    {
      :noreply,
      socket
      |> assign_current(dt)
    }
  end

  def assign_current(socket, dt) do
    dt = String.to_integer(dt)

    current =
      Enum.find(socket.assigns.data.weather.daily, fn day ->
        IO.inspect(dt, label: "Event: ")
        IO.inspect(day.dt, label: "Enum: ")
        if day.dt == dt, do: day
      end)

    IO.inspect(current)
    assign(socket, :current, current)
  end
end
