defmodule FridayProjectWeb.TuesdayLiveTest do
  use FridayProjectWeb.ConnCase

  import Phoenix.LiveViewTest
  import FridayProject.TuesdaysFixtures

  @create_attrs %{name: "some name", description: "some description", nb_thing: 42}
  @update_attrs %{name: "some updated name", description: "some updated description", nb_thing: 43}
  @invalid_attrs %{name: nil, description: nil, nb_thing: nil}

  defp create_tuesday(_) do
    tuesday = tuesday_fixture()
    %{tuesday: tuesday}
  end

  describe "Index" do
    setup [:create_tuesday]

    test "lists all tuesdays", %{conn: conn, tuesday: tuesday} do
      {:ok, _index_live, html} = live(conn, ~p"/tuesdays")

      assert html =~ "Listing Tuesdays"
      assert html =~ tuesday.name
    end

    test "saves new tuesday", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/tuesdays")

      assert index_live |> element("a", "New Tuesday") |> render_click() =~
               "New Tuesday"

      assert_patch(index_live, ~p"/tuesdays/new")

      assert index_live
             |> form("#tuesday-form", tuesday: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tuesday-form", tuesday: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tuesdays")

      html = render(index_live)
      assert html =~ "Tuesday created successfully"
      assert html =~ "some name"
    end

    test "updates tuesday in listing", %{conn: conn, tuesday: tuesday} do
      {:ok, index_live, _html} = live(conn, ~p"/tuesdays")

      assert index_live |> element("#tuesdays-#{tuesday.id} a", "Edit") |> render_click() =~
               "Edit Tuesday"

      assert_patch(index_live, ~p"/tuesdays/#{tuesday}/edit")

      assert index_live
             |> form("#tuesday-form", tuesday: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tuesday-form", tuesday: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tuesdays")

      html = render(index_live)
      assert html =~ "Tuesday updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes tuesday in listing", %{conn: conn, tuesday: tuesday} do
      {:ok, index_live, _html} = live(conn, ~p"/tuesdays")

      assert index_live |> element("#tuesdays-#{tuesday.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#tuesdays-#{tuesday.id}")
    end
  end

  describe "Show" do
    setup [:create_tuesday]

    test "displays tuesday", %{conn: conn, tuesday: tuesday} do
      {:ok, _show_live, html} = live(conn, ~p"/tuesdays/#{tuesday}")

      assert html =~ "Show Tuesday"
      assert html =~ tuesday.name
    end

    test "updates tuesday within modal", %{conn: conn, tuesday: tuesday} do
      {:ok, show_live, _html} = live(conn, ~p"/tuesdays/#{tuesday}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Tuesday"

      assert_patch(show_live, ~p"/tuesdays/#{tuesday}/show/edit")

      assert show_live
             |> form("#tuesday-form", tuesday: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#tuesday-form", tuesday: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/tuesdays/#{tuesday}")

      html = render(show_live)
      assert html =~ "Tuesday updated successfully"
      assert html =~ "some updated name"
    end
  end
end
