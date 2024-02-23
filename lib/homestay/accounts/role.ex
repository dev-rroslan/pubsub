defmodule Homestay.Accounts.Role do
  @moduledoc """
  The schema for role
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "roles" do
    field :title, :string
    field :id, :string, primary_key: true

    many_to_many :users, Homestay.Accounts.User,
      join_through: "user_roles",
      join_keys: [role_id: :id, user_id: :id],
      on_replace: :delete

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:id, :title])
    |> validate_required([:id, :title])
    |> validate_length(:title, max: 255)
  end
end
