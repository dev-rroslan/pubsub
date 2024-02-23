defmodule Homestay.Homes.Homeowner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "homeowners" do
    field :name, :string
    field :whatapp_phone_no, :string
    field :bank_ewallet, :string
    field :account_no, :string
    field :homeowner, :id
    has_one :user, Homestay.Accounts.User
    has_many :homes, Homestay.Homes.Home


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(homeowner, attrs) do
    homeowner
    |> cast(attrs, [:name, :whatapp_phone_no, :bank_ewallet, :account_no])
    |> validate_required([:name, :whatapp_phone_no, :bank_ewallet, :account_no])
  end
end
