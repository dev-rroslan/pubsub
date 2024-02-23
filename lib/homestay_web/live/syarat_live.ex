defmodule HomestayWeb.SyaratLive do
  use Phoenix.LiveView

  @doc """
  Renders the terms and conditions for the homestay.
  """
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Syarat")}
  end

  def render(assigns) do
    ~H"""
    <div class="p-4 md:p-8 text-white">
      <h1 class="text-xl font-semibold mb-4 bg-emPurple-dark px-4 py-2">Terms and Conditions</h1>
      <p class="mb-4">
        The following terms and conditions govern all use of the Homestay services and all content, services, and products available at or through the website. Our services are offered subject to your acceptance without modification of all of the terms and conditions contained herein and all other operating rules, policies (including, without limitation, Homestay's Privacy Policy), and procedures that may be published from time to time by Homestay (collectively, the “Agreement”).
      </p>
      <h2 class="text-lg font-semibold mb-4 bg-emPurple-dark px-4 py-2">Responsibility of Users</h2>
      <p class="mb-4">
        By operating the services, Homestay does not represent or imply that it endorses the material there posted, or that it believes such material to be accurate, useful, or non-harmful. Users are responsible for taking precautions as necessary to protect themselves and their computer systems from viruses, worms, Trojan horses, and other harmful or destructive content.
      </p>
      <!-- Additional terms and conditions will be added here -->
      <p class="mb-4">
        This is a draft version of the terms and conditions and is subject to change. Please review it periodically.
      </p>
    </div>
    """
  end
end
