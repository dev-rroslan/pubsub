defmodule HomestayWeb.NumbersLive do
  use HomestayWeb, :live_view

  def render(assigns) do
    ~H"""
    <LiveSvelte.svelte ssr={false} name="Simple" props={%{number: @number}} />
    """
  end

  def handle_event("set_number", %{"number" => number}, socket) do
    {:noreply, assign(socket, :number, number)}
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{number: 5, page_title: "Numbers"})}
  end
end
