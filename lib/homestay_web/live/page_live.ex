defmodule HomestayWeb.PageLive do
  use HomestayWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Cari HomeStay")}
  end

  def render(assigns) do
    ~H"""
    <div class="flex justify-center">
      <h1 class="text-3xl font-bold m-4 text-emLavender-light">Home listing here</h1>
    </div>
    """
  end
end
