defmodule Homestay.Repo do
  use Ecto.Repo,
    otp_app: :homestay,
    adapter: Ecto.Adapters.Postgres
end
