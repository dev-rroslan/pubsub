defmodule HomestayWeb.ConfirmLive do
  use HomestayWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="em-gradient flex justify-center">
      <h1 class="text-3xl font-bold m-4">Check Email, click link to confirm and proceed</h1>
    </div>
    """
  end

end
