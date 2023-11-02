defmodule FridayProject.WednesdaysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FridayProject.Wednesdays` context.
  """

  @doc """
  Generate a wednesday.
  """
  def wednesday_fixture(attrs \\ %{}) do
    {:ok, wednesday} =
      attrs
      |> Enum.into(%{
        name: "some name",
        firstname: "some firstname"
      })
      |> FridayProject.Wednesdays.create_wednesday()

    wednesday
  end
end
