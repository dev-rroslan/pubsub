defmodule HomestayWeb.HomeownerLiveTest do
  use HomestayWeb.ConnCase

  import Phoenix.LiveViewTest
  import Homestay.HomesFixtures

  @create_attrs %{name: "some name", whatapp_phone_no: "some whatapp_phone_no", bank_ewallet: "some bank_ewallet", account_no: "some account_no"}
  @update_attrs %{name: "some updated name", whatapp_phone_no: "some updated whatapp_phone_no", bank_ewallet: "some updated bank_ewallet", account_no: "some updated account_no"}
  @invalid_attrs %{name: nil, whatapp_phone_no: nil, bank_ewallet: nil, account_no: nil}

  defp create_homeowner(_) do
    homeowner = homeowner_fixture()
    %{homeowner: homeowner}
  end

  describe "Index" do
    setup [:create_homeowner]

    test "lists all homeowners", %{conn: conn, homeowner: homeowner} do
      {:ok, _index_live, html} = live(conn, ~p"/homeowners")

      assert html =~ "Listing Homeowners"
      assert html =~ homeowner.name
    end

    test "saves new homeowner", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/homeowners")

      assert index_live |> element("a", "New Homeowner") |> render_click() =~
               "New Homeowner"

      assert_patch(index_live, ~p"/homeowners/new")

      assert index_live
             |> form("#homeowner-form", homeowner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#homeowner-form", homeowner: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/homeowners")

      html = render(index_live)
      assert html =~ "Homeowner created successfully"
      assert html =~ "some name"
    end

    test "updates homeowner in listing", %{conn: conn, homeowner: homeowner} do
      {:ok, index_live, _html} = live(conn, ~p"/homeowners")

      assert index_live |> element("#homeowners-#{homeowner.id} a", "Edit") |> render_click() =~
               "Edit Homeowner"

      assert_patch(index_live, ~p"/homeowners/#{homeowner}/edit")

      assert index_live
             |> form("#homeowner-form", homeowner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#homeowner-form", homeowner: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/homeowners")

      html = render(index_live)
      assert html =~ "Homeowner updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes homeowner in listing", %{conn: conn, homeowner: homeowner} do
      {:ok, index_live, _html} = live(conn, ~p"/homeowners")

      assert index_live |> element("#homeowners-#{homeowner.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#homeowners-#{homeowner.id}")
    end
  end

  describe "Show" do
    setup [:create_homeowner]

    test "displays homeowner", %{conn: conn, homeowner: homeowner} do
      {:ok, _show_live, html} = live(conn, ~p"/homeowners/#{homeowner}")

      assert html =~ "Show Homeowner"
      assert html =~ homeowner.name
    end

    test "updates homeowner within modal", %{conn: conn, homeowner: homeowner} do
      {:ok, show_live, _html} = live(conn, ~p"/homeowners/#{homeowner}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Homeowner"

      assert_patch(show_live, ~p"/homeowners/#{homeowner}/show/edit")

      assert show_live
             |> form("#homeowner-form", homeowner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#homeowner-form", homeowner: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/homeowners/#{homeowner}")

      html = render(show_live)
      assert html =~ "Homeowner updated successfully"
      assert html =~ "some updated name"
    end
  end
end
