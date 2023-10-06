defmodule FridayProject.WeekEndsTest do
  use FridayProject.DataCase

  alias FridayProject.WeekEnds

  describe "parties" do
    alias FridayProject.WeekEnds.Party

    import FridayProject.WeekEndsFixtures

    @invalid_attrs %{name: nil, date_party: nil}

    test "list_parties/0 returns all parties" do
      party = party_fixture()
      assert WeekEnds.list_parties() == [party]
    end

    test "get_party!/1 returns the party with given id" do
      party = party_fixture()
      assert WeekEnds.get_party!(party.id) == party
    end

    test "create_party/1 with valid data creates a party" do
      valid_attrs = %{name: "some name", date_party: ~N[2023-10-05 14:52:00]}

      assert {:ok, %Party{} = party} = WeekEnds.create_party(valid_attrs)
      assert party.name == "some name"
      assert party.date_party == ~N[2023-10-05 14:52:00]
    end

    test "create_party/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WeekEnds.create_party(@invalid_attrs)
    end

    test "update_party/2 with valid data updates the party" do
      party = party_fixture()
      update_attrs = %{name: "some updated name", date_party: ~N[2023-10-06 14:52:00]}

      assert {:ok, %Party{} = party} = WeekEnds.update_party(party, update_attrs)
      assert party.name == "some updated name"
      assert party.date_party == ~N[2023-10-06 14:52:00]
    end

    test "update_party/2 with invalid data returns error changeset" do
      party = party_fixture()
      assert {:error, %Ecto.Changeset{}} = WeekEnds.update_party(party, @invalid_attrs)
      assert party == WeekEnds.get_party!(party.id)
    end

    test "delete_party/1 deletes the party" do
      party = party_fixture()
      assert {:ok, %Party{}} = WeekEnds.delete_party(party)
      assert_raise Ecto.NoResultsError, fn -> WeekEnds.get_party!(party.id) end
    end

    test "change_party/1 returns a party changeset" do
      party = party_fixture()
      assert %Ecto.Changeset{} = WeekEnds.change_party(party)
    end
  end
end
