defmodule HomestayWeb.CaraLive do
  use Phoenix.LiveView

  import HomestayWeb.CoreComponents

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="p-4 mx-auto max-w-md">
      <.header class="mb-6 text-center">
        Cara Guna - How to Use
        <:subtitle>
          Follow these steps to register and start using our homestay:
        </:subtitle>
      </.header>

      <ol class="list-decimal list-inside">
        <li class="mb-4 text-white">
          Enter your email to register. You will receive an email with a special link.
        </li>
        <li class="mb-4 text-white">
          Click on the link in your email to access the secure password form.
        </li>
        <li class="mb-4 text-white">
          Create your password and submit the form. You will be automatically logged in to your account.
        </li>
      </ol>
      <.header class="mb-6 text-center">
        <:subtitle>
          Follow these steps to add your homestay and start renting out:
        </:subtitle>
      </.header>

      <ol class="list-decimal list-inside">
        <li class="mb-4 text-white">
          Click on the user logo and click Profile
        </li>
        <li class="mb-4 text-white">
          On your Profile page, click Add Homestay. There will also be a section on your bookings.
        </li>
        <li class="mb-4 text-white">
          You register as a homestay owner after you submit the form.
        </li>
        <li class="mb-4 text-white">
          You will be able to add homestays. Make sure to fill in the correct information. Admin will approve your homestay if everything is correct.
        </li>
        <li class="mb-4 text-white">
          If you edit your homestay, Admin will need to re-approve your changes.
        </li>
        <li class="mb-4 text-white">
          Payment to your account will be processed in 2 days after homestay checkout. Much easier if account is Touch & Go DuitNow Mobile Number.
        </li>
      </ol>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Cara Guna")}
  end
end
