defmodule HomestayWeb.UserComponent do
  # In Phoenix apps, the line is typically: use MyAppWeb, :live_component
  use HomestayWeb, :live_component # use Phoenix.LiveComponent




  def render(assigns) do
    ~H"""
    <div id={"user-\#{@id}"} class="user">
      <%= @user.email %>
    </div>
    """
  end
end
