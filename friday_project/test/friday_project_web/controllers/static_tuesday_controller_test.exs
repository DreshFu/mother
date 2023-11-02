defmodule FridayProjectWeb.StaticTuesdayControllerTest do
  use FridayProjectWeb.ConnCase

  import FridayProject.StaticTuesdaysFixtures

  @create_attrs %{name: "some name", description: "some description", nb_thing: 42}
  @update_attrs %{name: "some updated name", description: "some updated description", nb_thing: 43}
  @invalid_attrs %{name: nil, description: nil, nb_thing: nil}

  describe "index" do
    test "lists all statictuesdays", %{conn: conn} do
      conn = get(conn, ~p"/statictuesdays")
      assert html_response(conn, 200) =~ "Listing Statictuesdays"
    end
  end

  describe "new static_tuesday" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/statictuesdays/new")
      assert html_response(conn, 200) =~ "New Static tuesday"
    end
  end

  describe "create static_tuesday" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/statictuesdays", static_tuesday: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/statictuesdays/#{id}"

      conn = get(conn, ~p"/statictuesdays/#{id}")
      assert html_response(conn, 200) =~ "Static tuesday #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/statictuesdays", static_tuesday: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Static tuesday"
    end
  end

  describe "edit static_tuesday" do
    setup [:create_static_tuesday]

    test "renders form for editing chosen static_tuesday", %{conn: conn, static_tuesday: static_tuesday} do
      conn = get(conn, ~p"/statictuesdays/#{static_tuesday}/edit")
      assert html_response(conn, 200) =~ "Edit Static tuesday"
    end
  end

  describe "update static_tuesday" do
    setup [:create_static_tuesday]

    test "redirects when data is valid", %{conn: conn, static_tuesday: static_tuesday} do
      conn = put(conn, ~p"/statictuesdays/#{static_tuesday}", static_tuesday: @update_attrs)
      assert redirected_to(conn) == ~p"/statictuesdays/#{static_tuesday}"

      conn = get(conn, ~p"/statictuesdays/#{static_tuesday}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, static_tuesday: static_tuesday} do
      conn = put(conn, ~p"/statictuesdays/#{static_tuesday}", static_tuesday: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Static tuesday"
    end
  end

  describe "delete static_tuesday" do
    setup [:create_static_tuesday]

    test "deletes chosen static_tuesday", %{conn: conn, static_tuesday: static_tuesday} do
      conn = delete(conn, ~p"/statictuesdays/#{static_tuesday}")
      assert redirected_to(conn) == ~p"/statictuesdays"

      assert_error_sent 404, fn ->
        get(conn, ~p"/statictuesdays/#{static_tuesday}")
      end
    end
  end

  defp create_static_tuesday(_) do
    static_tuesday = static_tuesday_fixture()
    %{static_tuesday: static_tuesday}
  end
end
