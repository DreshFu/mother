defmodule FridayProject.WednesdaysTest do
  use FridayProject.DataCase

  alias FridayProject.Wednesdays

  describe "wednesdays" do
    alias FridayProject.Wednesdays.Wednesday

    import FridayProject.WednesdaysFixtures

    @invalid_attrs %{name: nil, firstname: nil}

    test "list_wednesdays/0 returns all wednesdays" do
      wednesday = wednesday_fixture()
      assert Wednesdays.list_wednesdays() == [wednesday]
    end

    test "get_wednesday!/1 returns the wednesday with given id" do
      wednesday = wednesday_fixture()
      assert Wednesdays.get_wednesday!(wednesday.id) == wednesday
    end

    test "create_wednesday/1 with valid data creates a wednesday" do
      valid_attrs = %{name: "some name", firstname: "some firstname"}

      assert {:ok, %Wednesday{} = wednesday} = Wednesdays.create_wednesday(valid_attrs)
      assert wednesday.name == "some name"
      assert wednesday.firstname == "some firstname"
    end

    test "create_wednesday/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wednesdays.create_wednesday(@invalid_attrs)
    end

    test "update_wednesday/2 with valid data updates the wednesday" do
      wednesday = wednesday_fixture()
      update_attrs = %{name: "some updated name", firstname: "some updated firstname"}

      assert {:ok, %Wednesday{} = wednesday} = Wednesdays.update_wednesday(wednesday, update_attrs)
      assert wednesday.name == "some updated name"
      assert wednesday.firstname == "some updated firstname"
    end

    test "update_wednesday/2 with invalid data returns error changeset" do
      wednesday = wednesday_fixture()
      assert {:error, %Ecto.Changeset{}} = Wednesdays.update_wednesday(wednesday, @invalid_attrs)
      assert wednesday == Wednesdays.get_wednesday!(wednesday.id)
    end

    test "delete_wednesday/1 deletes the wednesday" do
      wednesday = wednesday_fixture()
      assert {:ok, %Wednesday{}} = Wednesdays.delete_wednesday(wednesday)
      assert_raise Ecto.NoResultsError, fn -> Wednesdays.get_wednesday!(wednesday.id) end
    end

    test "change_wednesday/1 returns a wednesday changeset" do
      wednesday = wednesday_fixture()
      assert %Ecto.Changeset{} = Wednesdays.change_wednesday(wednesday)
    end
  end
end
