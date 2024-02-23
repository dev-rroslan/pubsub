defmodule Homestay.Repo.Migrations.ModifyConfirmedAtTypeInUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :confirmed_at
      add :confirmed_at, :utc_datetime
    end

  end
end
