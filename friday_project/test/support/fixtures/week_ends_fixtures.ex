defmodule FridayProject.WeekEndsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FridayProject.WeekEnds` context.
  """

  @doc """
  Generate a party.
  """
  def party_fixture(attrs \\ %{}) do
    {:ok, party} =
      attrs
      |> Enum.into(%{
        name: "some name",
        date_party: ~N[2023-10-05 14:52:00]
      })
      |> FridayProject.WeekEnds.create_party()

    party
  end
end
