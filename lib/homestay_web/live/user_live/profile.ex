defmodule HomestayWeb.UserLive.Profile do
  use HomestayWeb, :live_view

  alias Homestay.Homes.Homeowner
  alias Homestay.Homes.Home
  alias Homestay.Repo
  alias Homestay.Accounts


  @impl true
  def mount(params, _session, socket) do
    current_user = socket.assigns.current_user
    user = Accounts.get_user!(params["id"])
    user = user
           |> Repo.preload([[homeowner: :homes],:roles])
    roles = Enum.map(current_user.roles, fn role -> role.id end)
    if (user.id == current_user.id) || ("admin" in roles || "super_admin" in roles) do

    {
      :ok,
      socket
      |> assign(:user, user)

    }
  else
    {
      :ok,
      socket
      |> redirect(to: ~p"/")

    }
  end

end
@impl true
def handle_params(_, _, socket) do
  {
    :noreply,
    socket
    |> assign(:homeowner, %Homeowner{})
    |> assign(:home, %Home{})
    |> assign(:page_title, page_title(socket.assigns.live_action))
    |> assign(:subtitle, "Become Homeowner")
  }
end

@impl true
def handle_info({HomestayWeb.UserLive.HomeFormComponent, {:saved, _home}}, socket) do
  user = Accounts.get_user!(socket.assigns.user.id)
  {
    :noreply,
    socket
    |> assign(
         :user,
         user
         |> Repo.preload([[homeowner: :homes], :roles])
       )
  }
end

@impl true
def handle_info({HomestayWeb.UserLive.FormComponent, {:saved, _homeowner}}, socket) do
  user = Accounts.get_user!(socket.assigns.user.id)
  {
    :noreply,
    socket
    |> assign(
         :user,
         user
         |> Repo.preload([[homeowner: :homes], :roles])
       )
  }
end


defp page_title(:profile), do: "Show User"
defp page_title(:homeowner), do: "Homeowner"
defp page_title(:home), do: "Home"
end
