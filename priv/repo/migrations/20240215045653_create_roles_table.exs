defmodule Homestay.Repo.Migrations.CreateRolesTable do
  use Ecto.Migration

  def change do
    create table(:roles, primary_key: false) do
      add :id, :string, primary_key: true
      add :title, :string
      timestamps()
    end
  end
end
