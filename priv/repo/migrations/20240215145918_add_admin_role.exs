defmodule Homestay.Repo.Migrations.AddAdminRole do
  use Ecto.Migration
  alias DateTime

  def change do
    {:ok, role1} =
      Homestay.Repo.insert(%Homestay.Accounts.Role{id: "super_admin", title: "Super Admin"})

    {:ok, _role2} = Homestay.Repo.insert(%Homestay.Accounts.Role{id: "admin", title: "Admin"})
    {:ok, _role3} = Homestay.Repo.insert(%Homestay.Accounts.Role{id: "user", title: "User"})

    {:ok, _role4} =
      Homestay.Repo.insert(%Homestay.Accounts.Role{id: "homeowner", title: "Homeowner"})

    {:ok, user} =
      Homestay.Accounts.register_user(%{
        email:
          System.get_env("ADMIN") || List.first(System.get_env("ADMIN") || ["gj5Wj@example.com"]),
        password:
          System.get_env("ADMIN_PASSWORD") || List.first(System.get_env("ADMIN_PASSWORD") || ["Ram.@bling@656."])
      })

    user
    |> Ecto.Changeset.change(%{confirmed_at: DateTime.utc_now() |> DateTime.truncate(:second)})
    |> Homestay.Repo.update!()

    {:ok, _user_role} =
      Homestay.Repo.insert(%Homestay.Accounts.UserRole{user_id: user.id, role_id: role1.id})
  end
end
