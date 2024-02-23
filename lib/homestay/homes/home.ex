defmodule Homestay.Homes.Home do
  use Ecto.Schema
  import Ecto.Changeset

  schema "homes" do
    field :state, :string
    field :zip, :string
    field :description, :string
    field :home_address, :string
    field :street, :string
    field :area, :string
    field :price_per_day, :string
    field :homes, :id
    belongs_to :homeowner, Homestay.Homes.Homeowner


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(home, attrs) do
    home
    |> cast(attrs, [:home_address, :description, :street, :area, :zip, :state, :price_per_day, :homeowner_id])
    |> validate_required([:home_address, :street, :area, :zip, :state, :price_per_day])
  end
end
