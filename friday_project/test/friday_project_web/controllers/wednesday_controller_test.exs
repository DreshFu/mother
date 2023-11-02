defmodule FridayProjectWeb.WednesdayControllerTest do
  use FridayProjectWeb.ConnCase

  import FridayProject.WednesdaysFixtures

  @create_attrs %{name: "some name", firstname: "some firstname"}
  @update_attrs %{name: "some updated name", firstname: "some updated firstname"}
  @invalid_attrs %{name: nil, firstname: nil}

  describe "index" do
    test "lists all wednesdays", %{conn: conn} do
      conn = get(conn, ~p"/wednesdays")
      assert html_response(conn, 200) =~ "Listing Wednesdays"
    end
  end

  describe "new wednesday" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/wednesdays/new")
      assert html_response(conn, 200) =~ "New Wednesday"
    end
  end

  describe "create wednesday" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/wednesdays", wednesday: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/wednesdays/#{id}"

      conn = get(conn, ~p"/wednesdays/#{id}")
      assert html_response(conn, 200) =~ "Wednesday #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/wednesdays", wednesday: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Wednesday"
    end
  end

  describe "edit wednesday" do
    setup [:create_wednesday]

    test "renders form for editing chosen wednesday", %{conn: conn, wednesday: wednesday} do
      conn = get(conn, ~p"/wednesdays/#{wednesday}/edit")
      assert html_response(conn, 200) =~ "Edit Wednesday"
    end
  end

  describe "update wednesday" do
    setup [:create_wednesday]

    test "redirects when data is valid", %{conn: conn, wednesday: wednesday} do
      conn = put(conn, ~p"/wednesdays/#{wednesday}", wednesday: @update_attrs)
      assert redirected_to(conn) == ~p"/wednesdays/#{wednesday}"

      conn = get(conn, ~p"/wednesdays/#{wednesday}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, wednesday: wednesday} do
      conn = put(conn, ~p"/wednesdays/#{wednesday}", wednesday: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Wednesday"
    end
  end

  describe "delete wednesday" do
    setup [:create_wednesday]

    test "deletes chosen wednesday", %{conn: conn, wednesday: wednesday} do
      conn = delete(conn, ~p"/wednesdays/#{wednesday}")
      assert redirected_to(conn) == ~p"/wednesdays"

      assert_error_sent 404, fn ->
        get(conn, ~p"/wednesdays/#{wednesday}")
      end
    end
  end

  defp create_wednesday(_) do
    wednesday = wednesday_fixture()
    %{wednesday: wednesday}
  end
end
