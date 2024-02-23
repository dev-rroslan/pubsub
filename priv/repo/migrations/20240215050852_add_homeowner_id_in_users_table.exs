defmodule Homestay.Repo.Migrations.AddHomeownerIdInUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :status, :string
      add :homeowner_id, references(:homeowners, on_delete: :nilify_all)
    end

    create index(:users, [:homeowner_id])
  end
end
