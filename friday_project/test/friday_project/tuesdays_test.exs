defmodule FridayProject.TuesdaysTest do
  use FridayProject.DataCase

  alias FridayProject.Tuesdays

  describe "tuesdays" do
    alias FridayProject.Tuesdays.Tuesday

    import FridayProject.TuesdaysFixtures

    @invalid_attrs %{name: nil, description: nil, nb_thing: nil}

    test "list_tuesdays/0 returns all tuesdays" do
      tuesday = tuesday_fixture()
      assert Tuesdays.list_tuesdays() == [tuesday]
    end

    test "get_tuesday!/1 returns the tuesday with given id" do
      tuesday = tuesday_fixture()
      assert Tuesdays.get_tuesday!(tuesday.id) == tuesday
    end

    test "create_tuesday/1 with valid data creates a tuesday" do
      valid_attrs = %{name: "some name", description: "some description", nb_thing: 42}

      assert {:ok, %Tuesday{} = tuesday} = Tuesdays.create_tuesday(valid_attrs)
      assert tuesday.name == "some name"
      assert tuesday.description == "some description"
      assert tuesday.nb_thing == 42
    end

    test "create_tuesday/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tuesdays.create_tuesday(@invalid_attrs)
    end

    test "update_tuesday/2 with valid data updates the tuesday" do
      tuesday = tuesday_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", nb_thing: 43}

      assert {:ok, %Tuesday{} = tuesday} = Tuesdays.update_tuesday(tuesday, update_attrs)
      assert tuesday.name == "some updated name"
      assert tuesday.description == "some updated description"
      assert tuesday.nb_thing == 43
    end

    test "update_tuesday/2 with invalid data returns error changeset" do
      tuesday = tuesday_fixture()
      assert {:error, %Ecto.Changeset{}} = Tuesdays.update_tuesday(tuesday, @invalid_attrs)
      assert tuesday == Tuesdays.get_tuesday!(tuesday.id)
    end

    test "delete_tuesday/1 deletes the tuesday" do
      tuesday = tuesday_fixture()
      assert {:ok, %Tuesday{}} = Tuesdays.delete_tuesday(tuesday)
      assert_raise Ecto.NoResultsError, fn -> Tuesdays.get_tuesday!(tuesday.id) end
    end

    test "change_tuesday/1 returns a tuesday changeset" do
      tuesday = tuesday_fixture()
      assert %Ecto.Changeset{} = Tuesdays.change_tuesday(tuesday)
    end
  end
end
