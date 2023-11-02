defmodule FridayProject.StaticTuesdaysTest do
  use FridayProject.DataCase

  alias FridayProject.StaticTuesdays

  describe "statictuesdays" do
    alias FridayProject.StaticTuesdays.StaticTuesday

    import FridayProject.StaticTuesdaysFixtures

    @invalid_attrs %{name: nil, description: nil, nb_thing: nil}

    test "list_statictuesdays/0 returns all statictuesdays" do
      static_tuesday = static_tuesday_fixture()
      assert StaticTuesdays.list_statictuesdays() == [static_tuesday]
    end

    test "get_static_tuesday!/1 returns the static_tuesday with given id" do
      static_tuesday = static_tuesday_fixture()
      assert StaticTuesdays.get_static_tuesday!(static_tuesday.id) == static_tuesday
    end

    test "create_static_tuesday/1 with valid data creates a static_tuesday" do
      valid_attrs = %{name: "some name", description: "some description", nb_thing: 42}

      assert {:ok, %StaticTuesday{} = static_tuesday} = StaticTuesdays.create_static_tuesday(valid_attrs)
      assert static_tuesday.name == "some name"
      assert static_tuesday.description == "some description"
      assert static_tuesday.nb_thing == 42
    end

    test "create_static_tuesday/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StaticTuesdays.create_static_tuesday(@invalid_attrs)
    end

    test "update_static_tuesday/2 with valid data updates the static_tuesday" do
      static_tuesday = static_tuesday_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", nb_thing: 43}

      assert {:ok, %StaticTuesday{} = static_tuesday} = StaticTuesdays.update_static_tuesday(static_tuesday, update_attrs)
      assert static_tuesday.name == "some updated name"
      assert static_tuesday.description == "some updated description"
      assert static_tuesday.nb_thing == 43
    end

    test "update_static_tuesday/2 with invalid data returns error changeset" do
      static_tuesday = static_tuesday_fixture()
      assert {:error, %Ecto.Changeset{}} = StaticTuesdays.update_static_tuesday(static_tuesday, @invalid_attrs)
      assert static_tuesday == StaticTuesdays.get_static_tuesday!(static_tuesday.id)
    end

    test "delete_static_tuesday/1 deletes the static_tuesday" do
      static_tuesday = static_tuesday_fixture()
      assert {:ok, %StaticTuesday{}} = StaticTuesdays.delete_static_tuesday(static_tuesday)
      assert_raise Ecto.NoResultsError, fn -> StaticTuesdays.get_static_tuesday!(static_tuesday.id) end
    end

    test "change_static_tuesday/1 returns a static_tuesday changeset" do
      static_tuesday = static_tuesday_fixture()
      assert %Ecto.Changeset{} = StaticTuesdays.change_static_tuesday(static_tuesday)
    end
  end
end
