defmodule Homestay.Repo.Migrations.CreateHomeowners do
  use Ecto.Migration

  def change do
    create table(:homeowners) do
      add :name, :string
      add :whatapp_phone_no, :string
      add :bank_ewallet, :string
      add :account_no, :string
      add :homeowner, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:homeowners, [:homeowner])
  end
end
