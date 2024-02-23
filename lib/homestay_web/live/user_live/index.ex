defmodule HomestayWeb.UserLive.Index do
  use HomestayWeb, :live_view

  alias Homestay.Accounts
  alias Homestay.Repo
  alias Homestay.Homes

  @impl true
  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user
    roles = Enum.map(current_user.roles, fn role -> role.id end)
    if "admin" in roles || "super_admin" in roles do
      {:ok, stream(socket, :users, Accounts.list_users())}
    else
      {
        :ok,
        socket
        |> redirect(to: ~p"/")

      }
    end

  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end


  @impl true
  def handle_event("search", p, socket) do
    {
      :noreply,
      socket
      |> assign(:search_key, p["search_key"])
      |> stream(:users, Accounts.list_users(p["search_key"]), reset: true)
    }

  end

  @impl true
  def handle_event("make_admin", %{"id" => id}, socket) do
    case Accounts.make_admin(id) do

      {:ok, _} ->
        {
          :noreply,
          socket
          |> put_flash(:info, "Successfully promoted to admin.")
          |> stream(:users, Accounts.list_users(socket.assigns[:search_key]), reset: true)
        }

      {:error, _changeset} ->
        {
          :noreply,
          socket
          |> put_flash(:error, "Already an Admin.")
        }


    end



  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    user = Accounts.get_user!(id)
           |> Repo.preload(:roles)
    roles = Enum.map(user.roles, fn role -> role.id end)

    cond do
      user.id == socket.assigns.current_user.id ->

        {
          :noreply,
          socket
          |> put_flash(:error, "You cannot delete yourself.")
        }

      "super_admin" in roles ->

        {
          :noreply,
          socket
          |> put_flash(:error, "You cannot delete Super Admin.")
        }
      true ->

        {:ok, _} = Accounts.delete_user(user)
        if user.homeowner_id do
          homeowner = Homes.get_homeowner!(user.homeowner_id)
          {:ok, _} = Homes.delete_homeowner(homeowner)
        end

        {:noreply, stream_delete(socket, :users, user)}

    end

  end


  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Users")
    |> assign(:user, nil)
  end

end
