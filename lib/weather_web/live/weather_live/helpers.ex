defmodule WeatherWeb.WeatherLive.Components.Helpers do
  use WeatherWeb, :component

  def board(assigns) do
    ~H"""
    <div class="grid grid-cols-12 grid-rows-3 grid-flow-row gap-4">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def bar(assigns) do
    bar_span = assigns[:bar_span]
    classes = bar_span <> " " <> "grid grid-cols-8 grid-rows-1 gap-x-3"

    assigns = assign(assigns, :classes, classes)

    ~H"""
    <div class={@classes}>
      <%= for day <- @daily do %>
        <%= render_slot(@inner_block, day) %>
      <% end %>
    </div>
    """
  end

  def card(assigns) do
    span = assigns[:span]
    classes = card_styling(assigns[:type]) <> " " <> span
    extras = assigns_to_attributes(assigns, [:span, :type, :footer, :header, :body])

    assigns =
      assigns
      |> assign_new(:header, fn -> [] end)
      |> assign_new(:footer, fn -> [] end)
      |> assign(:extras, extras)
      |> assign(:classes, classes)

    ~H"""
    <div class={@classes} {@extras}>
      <%= render_slot(@header)%>
      <%= render_slot(@body)%>
      <%= render_slot(@footer) %>
    </div>
    """
  end

  def card_styling(type) do
    case type do
      "default" ->
        "p-4 rounded-xl space-y-2"

      "bordered" ->
        "px-2 py-4 rounded-lg ring-2 ring-sky-500 space-y-3"

      "clickable" ->
        "px-2 py-4 rounded-lg ring-2 ring-sky-500 hover:bg-sky-500 cursor-pointer transition duration-500 space-y-2"

      _ ->
        ""
    end
  end

  def tabs(assigns) do
    ~H"""
    <div class="space-y-4">
      <div class="flex justify-center space-x-2">
        <%= render_slot(@tabs) %>
      </div>
      <div class="flex justify-center">
        <%= render_slot(@tab_body) %>
      </div>
    </div>
    """
  end

  def tab(assigns) do
    ~H"""
      <h1 class="px-2 py-1 font-bold text-sky-50 hover:bg-sky-200 hover:rounded-md rounded-md transition duration-500 cursor-pointer"
          phx-click="change_tab" phx-value-tab={@tab}>
        <%= @tab %>
      </h1>
    """
  end

  def temperature(assigns) do
    ~H"""
    <div class="grid grid-cols-4 grid-rows-1 gap-x-2 p-2">
      <.labeled_temp label="Day" temp={@temp.day} conversion={@conversion} />
      <.labeled_temp label="Morning" temp={@temp.morn} conversion={@conversion} />
      <.labeled_temp label="Evening" temp={@temp.eve} conversion={@conversion} />
      <.labeled_temp label="Night" temp={@temp.night} conversion={@conversion} />
    </div>
    """
  end

  def header(assigns) do
    ~H"""
    <h1 class=""><%= @title %></h1>
    """
  end

  def text(assigns) do
    ~H"""
    <p class="text-md text-sky-50"><%= @text %></p>
    """
  end

  def labeled_text(assigns) do
    ~H"""
    <div class="space-y-1">
      <h1 class="text-sm font-bold"><%= @label %></h1>
      <p class="text-sm"><%= @value %></p>
    </div>
    """
  end

  def labeled_img(assigns) do
    ~H"""
    <div class="flex flex-col justify-center space-y-4">
      <div class="flex justify-center">
        <.img src={@src} width="60px" height="60px" />
      </div>
      <.text text={@time} />
    </div>
    """
  end

  def card_label(assigns) do
    ~H"""
    <h1 class="text-xl font-bold text-sky-50"><%= @label %></h1>
    """
  end

  def img(assigns) do
    ~H"""
    <img src={@src} width={@width} height={@height} class="p-2 rounded-full bg-sky-300" />
    """
  end

  def location(assigns) do
    ~H"""
    <p class="text-3xl font-bold text-sky-50"><%= @location %></p>
    """
  end

  def datetime(assigns) do
    ~H"""
    <p class="text-sm text-sky-50 font-bold"><%= @dt %></p>
    """
  end

  def labeled_temp(assigns) do
    ~H"""
    <div class="text-center space-y-3">
      <.text text={@label} />
      <.temp temp={@temp} conversion={@conversion} />
    </div>
    """
  end

  def temp(assigns) do
    ~H"""
    <p class="text-3xl font-bold text-sky-100">
      <%= temp_conversion(@conversion, @temp) %><span class="font-light">&#176;</span>
    </p>
    """
  end
end
