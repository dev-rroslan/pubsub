defmodule Homestay.Repo.Migrations.CreateUserRolesTable do
  use Ecto.Migration

  def change do
    create table(:user_roles) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :role_id, references(:roles, on_delete: :delete_all, type: :string), null: false
      timestamps()
    end

    create unique_index(:user_roles, [:role_id, :user_id])
  end
end
