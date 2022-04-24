defmodule WeatherWeb.WeatherLive.Components do
  use WeatherWeb, :component

  import WeatherWeb.WeatherLive.Components.Helpers

  def location_card(assigns) do
    ~H"""
    <.card type="default" span={@span}>
        <:header>
          <div>
            <.location location={@location} />
          </div>
        </:header>
        <:body>
          <div>
            <.datetime dt={current_dt(:date, @timezone)} />
            <.datetime dt={current_dt(:time, @timezone)} />
          </div>
        </:body>
    </.card>
    """
  end

  def daily_forecast_bar(assigns) do
    ~H"""
    <.bar
      bar_span={@bar_span}
      let={day}
      daily={@daily}>
        <.day_card
          span={@card_span}
          day={day}
          conversion={@conversion} />
    </.bar>
    """
  end

  def day_card(assigns) do
    ~H"""
    <.card type="clickable" span={@span} phx-click="set-current" phx-value-dt={@day.dt}>
      <:header>
        <div class="flex justify-center">
          <.img src={@day.weather.icon} width="60px" height="60px" />
        </div>
      </:header>
      <:body>
        <div class="text-center">
          <.temp temp={@day.temp.day} conversion={@conversion} />
        </div>
      </:body>
      <:footer>
        <div class="text-center">
          <.datetime dt={weather_dt(:day, @day.dt)} />
          <.datetime dt={weather_dt(:short_date, @day.dt)} />
        </div>
      </:footer>
    </.card>
    """
  end

  def temperature_card(assigns) do
    ~H"""
    <.card type="bordered" span={@span}>
      <:body>
        <.tabs>
          <:tabs>
             <.tab tab="Temperature" />
             <.tab tab="Feels Like" />
          </:tabs>
          <:tab_body>
            <%= if @tab == "Temperature" do %>
              <.temperature temp={@temp} conversion={@conversion} />
            <% else %>
              <.temperature temp={@feels_like} conversion={@conversion} />
            <% end %>
          </:tab_body>
        </.tabs>
      </:body>
    </.card>
    """
  end

  def celestial_card(assigns) do
    ~H"""
    <.card type="bordered" span={@span}>
      <:header>
        <div class="text-center">
          <.card_label label={@label} />
        </div>
      </:header>
      <:body>
        <div class="flex justify-center space-x-4">
          <.labeled_img src={@celestial.rise_img} time={weather_dt(:time, @celestial.rise)} />
          <.labeled_img src={@celestial.set_img} time={weather_dt(:time, @celestial.set)} />
        </div>
      </:body>
    </.card>
    """
  end

  def moonphase_card(assigns) do
    ~H"""
    <.card type="bordered" span={@span}>
      <:header>
        <div class="text-center">
          <h1 class="text-lg font-bold text-sky-100"><%= @label %></h1>
        </div>
      </:header>
      <:body>
        <div class="flex justify-center">
          <.img src={@moon_phase.phase_img.img} width="60px" height="60px" />
        </div>
      </:body>
      <:footer>
        <div class="text-center">
          <p class="text-md font-bold text-sky-100"><%= @moon_phase.phase_img.label %></p>
        </div>
      </:footer>
    </.card>
    """
  end

  def forecast(assigns) do
    ~H"""
    <.card span="col-span-2" type="bordered">

    </.card>
    """
  end

  def wind_card(assigns) do
    ~H"""
    <div class="col-span-6 p-10 text-sky-800 text-center rounded-2xl ring-2 ring-sky-600 space-y-2">
      <div class="grid grid-cols-5 grid-rows-2 gap-4 text-sky-100">
        <.labeled_text label="Wind Degree" value={@wind.wind_deg} />
        <.labeled_text label="Wind Speed" value={@wind.wind_speed} />
        <.labeled_text label="Wind Gust" value={@wind.wind_gust} />
        <.labeled_text label="Clouds" value={@clouds} />
        <.labeled_text label="UVI" value={@uvi} />
        <.labeled_text label="Dew Point" value={@dew_point} />
        <.labeled_text label="Pressure" value={@dew_point} />
        <.labeled_text label="Humidity" value={@dew_point} />
        <.labeled_text label="Min. Temp." value={@min} />
        <.labeled_text label="Max. Temp." value={@max} />
      </div>
    </div>
    """
  end
end
