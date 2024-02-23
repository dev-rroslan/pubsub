defmodule HomestayWeb.PrivasiLive do
  use Phoenix.LiveView

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="p-4 md:p-8 text-white">
      <h1 class="text-xl font-semibold mb-4 bg-emPurple-dark px-4 py-2">Privacy Policy</h1>
      <p class="mb-4">
        At Homestay, we respect your privacy and are committed to protecting the personal information you share with us. This policy describes how we collect and use your personal data during your use of the Homestay services and website, and it provides information about the rights you have.
      </p>
      <h2 class="text-lg font-semibold mb-4 bg-emPurple-dark px-4 py-2">Collection of Information</h2>
      <p class="mb-4">
        We collect information that you provide to us directly, such as when you create an account, use our services, or communicate with us. We also automatically collect certain information when you use our website, such as usage details and IP address.
      </p>
      <h2 class="text-lg font-semibold mb-4 bg-emPurple-dark px-4 py-2">Use of Information</h2>
      <p class="mb-4">
        The information we collect is used to provide, maintain, and improve our services, to communicate with you, and to comply with legal obligations.
      </p>
      <!-- Additional privacy information will be added here -->
      <p class="mb-4">
        This is a draft version of the Privacy Policy and is subject to change. Please review it periodically.
      </p>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Privasi")}
  end
end
