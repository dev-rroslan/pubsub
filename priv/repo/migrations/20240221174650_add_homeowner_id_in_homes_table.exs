defmodule Homestay.Repo.Migrations.AddHomeownerIdInHomesTable do
  use Ecto.Migration
  def change do
    alter table(:homes) do
      add :homeowner_id, references(:homeowners, on_delete: :delete_all)
    end

    create index(:homes, [:homeowner_id])
  end
end
