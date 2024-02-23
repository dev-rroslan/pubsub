defmodule Homestay.Accounts.UserRole do
  @moduledoc """
  The schema for users roles
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_roles" do
    belongs_to :role, Homestay.Accounts.Role, type: :string
    belongs_to :user, Homestay.Accounts.User
    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:role_id, :user_id])
    |> validate_required([:role_id, :user_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:role_id)
    |> unique_constraint([:role_id, :user_id])
  end
end
