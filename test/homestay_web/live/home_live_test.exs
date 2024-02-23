defmodule HomestayWeb.HomeLiveTest do
  use HomestayWeb.ConnCase

  import Phoenix.LiveViewTest
  import Homestay.HomesFixtures

  @create_attrs %{state: "some state", zip: "some zip", home_address: "some home_address", street: "some street", area: "some area", price_per_day: "some price_per_day"}
  @update_attrs %{state: "some updated state", zip: "some updated zip", home_address: "some updated home_address", street: "some updated street", area: "some updated area", price_per_day: "some updated price_per_day"}
  @invalid_attrs %{state: nil, zip: nil, home_address: nil, street: nil, area: nil, price_per_day: nil}

  defp create_home(_) do
    home = home_fixture()
    %{home: home}
  end

  describe "Index" do
    setup [:create_home]

    test "lists all homes", %{conn: conn, home: home} do
      {:ok, _index_live, html} = live(conn, ~p"/homes")

      assert html =~ "Listing Homes"
      assert html =~ home.state
    end

    test "saves new home", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/homes")

      assert index_live |> element("a", "New Home") |> render_click() =~
               "New Home"

      assert_patch(index_live, ~p"/homes/new")

      assert index_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#home-form", home: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/homes")

      html = render(index_live)
      assert html =~ "Home created successfully"
      assert html =~ "some state"
    end

    test "updates home in listing", %{conn: conn, home: home} do
      {:ok, index_live, _html} = live(conn, ~p"/homes")

      assert index_live |> element("#homes-#{home.id} a", "Edit") |> render_click() =~
               "Edit Home"

      assert_patch(index_live, ~p"/homes/#{home}/edit")

      assert index_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#home-form", home: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/homes")

      html = render(index_live)
      assert html =~ "Home updated successfully"
      assert html =~ "some updated state"
    end

    test "deletes home in listing", %{conn: conn, home: home} do
      {:ok, index_live, _html} = live(conn, ~p"/homes")

      assert index_live |> element("#homes-#{home.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#homes-#{home.id}")
    end
  end

  describe "Show" do
    setup [:create_home]

    test "displays home", %{conn: conn, home: home} do
      {:ok, _show_live, html} = live(conn, ~p"/homes/#{home}")

      assert html =~ "Show Home"
      assert html =~ home.state
    end

    test "updates home within modal", %{conn: conn, home: home} do
      {:ok, show_live, _html} = live(conn, ~p"/homes/#{home}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Home"

      assert_patch(show_live, ~p"/homes/#{home}/show/edit")

      assert show_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#home-form", home: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/homes/#{home}")

      html = render(show_live)
      assert html =~ "Home updated successfully"
      assert html =~ "some updated state"
    end
  end
end
