defmodule HomestayWeb.UserLive.HomeFormComponent do
  use HomestayWeb, :live_component

  alias Homestay.Homes


  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Add Home.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="home-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:home_address]} type="text" label="Home address" />
        <.input field={@form[:street]} type="text" label="Street" />
        <.input field={@form[:area]} type="text" label="Area" />
        <.input field={@form[:zip]} type="text" label="Zip" />
        <.input field={@form[:state]} type="text" label="State" />
        <.input field={@form[:price_per_day]} type="text" label="Price per day" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Home</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{home: home} = assigns, socket) do
    changeset = Homes.change_home(home)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"home" => home_params}, socket) do
    changeset =
      socket.assigns.home
      |> Homes.change_home(home_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"home" => home_params}, socket) do
    save_home(socket, socket.assigns.action, home_params)
  end


  defp save_home(socket, :home, home_params) do
    case Homes.create_home(Map.merge(home_params, %{"homeowner_id" => socket.assigns.current_user.homeowner_id})) do
      {:ok, home} ->
        notify_parent({:saved, home})

        {:noreply,
         socket
         |> put_flash(:info, "Home created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->

        {:noreply, assign_form(socket, changeset |> Map.put(:action, :validate))}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
