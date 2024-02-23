defmodule Homestay.HomesTest do
  use Homestay.DataCase

  alias Homestay.Homes

  describe "homeowners" do
    alias Homestay.Homes.Homeowner

    import Homestay.HomesFixtures

    @invalid_attrs %{name: nil, whatapp_phone_no: nil, bank_ewallet: nil, account_no: nil}

    test "list_homeowners/0 returns all homeowners" do
      homeowner = homeowner_fixture()
      assert Homes.list_homeowners() == [homeowner]
    end

    test "get_homeowner!/1 returns the homeowner with given id" do
      homeowner = homeowner_fixture()
      assert Homes.get_homeowner!(homeowner.id) == homeowner
    end

    test "create_homeowner/1 with valid data creates a homeowner" do
      valid_attrs = %{name: "some name", whatapp_phone_no: "some whatapp_phone_no", bank_ewallet: "some bank_ewallet", account_no: "some account_no"}

      assert {:ok, %Homeowner{} = homeowner} = Homes.create_homeowner(valid_attrs)
      assert homeowner.name == "some name"
      assert homeowner.whatapp_phone_no == "some whatapp_phone_no"
      assert homeowner.bank_ewallet == "some bank_ewallet"
      assert homeowner.account_no == "some account_no"
    end

    test "create_homeowner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Homes.create_homeowner(@invalid_attrs)
    end

    test "update_homeowner/2 with valid data updates the homeowner" do
      homeowner = homeowner_fixture()
      update_attrs = %{name: "some updated name", whatapp_phone_no: "some updated whatapp_phone_no", bank_ewallet: "some updated bank_ewallet", account_no: "some updated account_no"}

      assert {:ok, %Homeowner{} = homeowner} = Homes.update_homeowner(homeowner, update_attrs)
      assert homeowner.name == "some updated name"
      assert homeowner.whatapp_phone_no == "some updated whatapp_phone_no"
      assert homeowner.bank_ewallet == "some updated bank_ewallet"
      assert homeowner.account_no == "some updated account_no"
    end

    test "update_homeowner/2 with invalid data returns error changeset" do
      homeowner = homeowner_fixture()
      assert {:error, %Ecto.Changeset{}} = Homes.update_homeowner(homeowner, @invalid_attrs)
      assert homeowner == Homes.get_homeowner!(homeowner.id)
    end

    test "delete_homeowner/1 deletes the homeowner" do
      homeowner = homeowner_fixture()
      assert {:ok, %Homeowner{}} = Homes.delete_homeowner(homeowner)
      assert_raise Ecto.NoResultsError, fn -> Homes.get_homeowner!(homeowner.id) end
    end

    test "change_homeowner/1 returns a homeowner changeset" do
      homeowner = homeowner_fixture()
      assert %Ecto.Changeset{} = Homes.change_homeowner(homeowner)
    end
  end

  describe "homes" do
    alias Homestay.Homes.Home

    import Homestay.HomesFixtures

    @invalid_attrs %{state: nil, zip: nil, home_address: nil, street: nil, area: nil, price_per_day: nil}

    test "list_homes/0 returns all homes" do
      home = home_fixture()
      assert Homes.list_homes() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Homes.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      valid_attrs = %{state: "some state", zip: "some zip", home_address: "some home_address", street: "some street", area: "some area", price_per_day: "some price_per_day"}

      assert {:ok, %Home{} = home} = Homes.create_home(valid_attrs)
      assert home.state == "some state"
      assert home.zip == "some zip"
      assert home.home_address == "some home_address"
      assert home.street == "some street"
      assert home.area == "some area"
      assert home.price_per_day == "some price_per_day"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Homes.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      update_attrs = %{state: "some updated state", zip: "some updated zip", home_address: "some updated home_address", street: "some updated street", area: "some updated area", price_per_day: "some updated price_per_day"}

      assert {:ok, %Home{} = home} = Homes.update_home(home, update_attrs)
      assert home.state == "some updated state"
      assert home.zip == "some updated zip"
      assert home.home_address == "some updated home_address"
      assert home.street == "some updated street"
      assert home.area == "some updated area"
      assert home.price_per_day == "some updated price_per_day"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Homes.update_home(home, @invalid_attrs)
      assert home == Homes.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Homes.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Homes.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Homes.change_home(home)
    end
  end
end
