defmodule FridayProject.TuesdaysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FridayProject.Tuesdays` context.
  """

  @doc """
  Generate a tuesday.
  """
  def tuesday_fixture(attrs \\ %{}) do
    {:ok, tuesday} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        nb_thing: 42
      })
      |> FridayProject.Tuesdays.create_tuesday()

    tuesday
  end
end
