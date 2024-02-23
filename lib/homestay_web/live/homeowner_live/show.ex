defmodule HomestayWeb.HomeownerLive.Show do
  use HomestayWeb, :live_view

  alias Homestay.Homes

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:homeowner, Homes.get_homeowner!(id))}
  end

  defp page_title(:show), do: "Show Homeowner"
  defp page_title(:edit), do: "Edit Homeowner"
end
