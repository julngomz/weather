defmodule Weather.OpenWeatherMap.Daily.MoonPhase do
  defstruct ~w[phase phase_img]a

  def new(moonphase) do
    %__MODULE__{
      phase: convert_to_percent(moonphase),
      phase_img: moonphase |> convert_to_percent() |> phase_img()
    }
  end

  defp convert_to_percent(moonphase) do
    (moonphase * 100) |> round()
  end

  defp phase_img(moonphase) do
    cond do
      moonphase >= 0 and moonphase <= 11 ->
        %{img: "/images/moon_phase/new-moon-96.png", label: "New Moon"}

      moonphase > 12 and moonphase <= 22 ->
        %{img: "/images/moon_phase/waxing-crescent-moon-96.png", label: "Waxing Crescent"}

      moonphase > 23 and moonphase <= 33 ->
        %{img: "/images/moon_phase/first-quarter-moon.png", label: "First Quarter"}

      moonphase > 34 and moonphase <= 44 ->
        %{img: "/images/moon_phase/waxing-gibbous-moon-96.png", label: "Waxing Gibbus"}

      moonphase > 45 and moonphase <= 55 ->
        %{img: "/images/moon_phase/full-moon-96.png", label: "Full Moon"}

      moonphase > 56 and moonphase <= 66 ->
        %{img: "/images/moon_phase/waning-gibbous-moon-96.png", label: "Waning Gibbus"}

      moonphase > 67 and moonphase <= 77 ->
        %{img: "/images/moon_phase/last-quarter-moon-96.png", label: "Last Quarter"}

      moonphase > 78 and moonphase <= 88 ->
        %{img: "/images/moon_phase/waning-quarter-moon-96.png", label: "Waning Crescent"}

      moonphase > 89 and moonphase <= 100 ->
        %{img: "/images/moon_phase/new-moon-96.png", label: "New Moon"}
    end
  end
end
