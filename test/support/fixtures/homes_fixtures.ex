defmodule Homestay.HomesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Homestay.Homes` context.
  """

  @doc """
  Generate a homeowner.
  """
  def homeowner_fixture(attrs \\ %{}) do
    {:ok, homeowner} =
      attrs
      |> Enum.into(%{
        account_no: "some account_no",
        bank_ewallet: "some bank_ewallet",
        name: "some name",
        whatapp_phone_no: "some whatapp_phone_no"
      })
      |> Homestay.Homes.create_homeowner()

    homeowner
  end

  @doc """
  Generate a home.
  """
  def home_fixture(attrs \\ %{}) do
    {:ok, home} =
      attrs
      |> Enum.into(%{
        area: "some area",
        home_address: "some home_address",
        price_per_day: "some price_per_day",
        state: "some state",
        street: "some street",
        zip: "some zip"
      })
      |> Homestay.Homes.create_home()

    home
  end
end
