defmodule HomestayWeb.UserLive.FormComponent do
  use HomestayWeb, :live_component

  alias Homestay.Homes
  alias Homestay.Accounts


  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle><%= @subtitle %> </:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="homeowner-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:whatapp_phone_no]} type="text" label="Whatapp phone no" />
        <.input field={@form[:bank_ewallet]} type="text" label="Bank ewallet" />
        <.input field={@form[:account_no]} type="text" label="Account no" />
        <:actions>
          <.button phx-disable-with="Saving...">Save as Homeowner</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{homeowner: homeowner} = assigns, socket) do
    changeset = Homes.change_homeowner(homeowner)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"homeowner" => homeowner_params}, socket) do
    changeset =
      socket.assigns.homeowner
      |> Homes.change_homeowner(homeowner_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"homeowner" => homeowner_params}, socket) do
    save_homeowner(socket, socket.assigns.action, homeowner_params)
  end

  defp save_homeowner(socket, :homeowner, homeowner_params) do
    case Accounts.add_user_as_homeowner(homeowner_params,socket.assigns.current_user) do
      {:ok, homeowner} ->

        notify_parent({:saved, homeowner})

        {:noreply,
         socket
         |> put_flash(:info, "Successfully added as homeowner")
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
