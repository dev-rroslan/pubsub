defmodule HomestayWeb.HomeownerLive.Index do
  use HomestayWeb, :live_view

  alias Homestay.Homes
  alias Homestay.Homes.Homeowner

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :homeowners, Homes.list_homeowners())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Homeowner")
    |> assign(:homeowner, Homes.get_homeowner!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Homeowner")
    |> assign(:homeowner, %Homeowner{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Homeowners")
    |> assign(:homeowner, nil)
  end

  @impl true
  def handle_info({HomestayWeb.HomeownerLive.FormComponent, {:saved, homeowner}}, socket) do
    {:noreply, stream_insert(socket, :homeowners, homeowner)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    homeowner = Homes.get_homeowner!(id)
    {:ok, _} = Homes.delete_homeowner(homeowner)

    {:noreply, stream_delete(socket, :homeowners, homeowner)}
  end
end
