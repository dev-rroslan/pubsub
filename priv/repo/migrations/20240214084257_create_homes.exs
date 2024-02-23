defmodule Homestay.Repo.Migrations.CreateHomes do
  use Ecto.Migration

  def change do
    create table(:homes) do
      add :home_address, :string
      add :description, :string
      add :street, :string
      add :area, :string
      add :zip, :string
      add :state, :string
      add :price_per_day, :string
      add :homes, references(:homeowners, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:homes, [:homes])
  end
end
