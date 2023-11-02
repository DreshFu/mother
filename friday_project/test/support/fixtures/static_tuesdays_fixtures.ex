defmodule FridayProject.StaticTuesdaysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FridayProject.StaticTuesdays` context.
  """

  @doc """
  Generate a static_tuesday.
  """
  def static_tuesday_fixture(attrs \\ %{}) do
    {:ok, static_tuesday} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        nb_thing: 42
      })
      |> FridayProject.StaticTuesdays.create_static_tuesday()

    static_tuesday
  end
end
