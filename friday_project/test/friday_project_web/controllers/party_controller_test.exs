defmodule FridayProjectWeb.PartyControllerTest do
  use FridayProjectWeb.ConnCase

  import FridayProject.WeekEndsFixtures

  @create_attrs %{name: "some name", date_party: ~N[2023-10-05 14:52:00]}
  @update_attrs %{name: "some updated name", date_party: ~N[2023-10-06 14:52:00]}
  @invalid_attrs %{name: nil, date_party: nil}

  describe "index" do
    test "lists all parties", %{conn: conn} do
      conn = get(conn, ~p"/parties")
      assert html_response(conn, 200) =~ "Listing Parties"
    end
  end

  describe "new party" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/parties/new")
      assert html_response(conn, 200) =~ "New Party"
    end
  end

  describe "create party" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/parties", party: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/parties/#{id}"

      conn = get(conn, ~p"/parties/#{id}")
      assert html_response(conn, 200) =~ "Party #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/parties", party: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Party"
    end
  end

  describe "edit party" do
    setup [:create_party]

    test "renders form for editing chosen party", %{conn: conn, party: party} do
      conn = get(conn, ~p"/parties/#{party}/edit")
      assert html_response(conn, 200) =~ "Edit Party"
    end
  end

  describe "update party" do
    setup [:create_party]

    test "redirects when data is valid", %{conn: conn, party: party} do
      conn = put(conn, ~p"/parties/#{party}", party: @update_attrs)
      assert redirected_to(conn) == ~p"/parties/#{party}"

      conn = get(conn, ~p"/parties/#{party}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, party: party} do
      conn = put(conn, ~p"/parties/#{party}", party: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Party"
    end
  end

  describe "delete party" do
    setup [:create_party]

    test "deletes chosen party", %{conn: conn, party: party} do
      conn = delete(conn, ~p"/parties/#{party}")
      assert redirected_to(conn) == ~p"/parties"

      assert_error_sent 404, fn ->
        get(conn, ~p"/parties/#{party}")
      end
    end
  end

  defp create_party(_) do
    party = party_fixture()
    %{party: party}
  end
end
