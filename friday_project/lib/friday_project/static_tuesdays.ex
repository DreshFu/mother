defmodule FridayProject.StaticTuesdays do
  @moduledoc """
  The StaticTuesdays context.
  """

  import Ecto.Query, warn: false
  alias FridayProject.Repo

  alias FridayProject.StaticTuesdays.StaticTuesday

  @doc """
  Returns the list of statictuesdays.

  ## Examples

      iex> list_statictuesdays()
      [%StaticTuesday{}, ...]

  """
  def list_statictuesdays do
    Repo.all(StaticTuesday)
  end

  @doc """
  Gets a single static_tuesday.

  Raises `Ecto.NoResultsError` if the Static tuesday does not exist.

  ## Examples

      iex> get_static_tuesday!(123)
      %StaticTuesday{}

      iex> get_static_tuesday!(456)
      ** (Ecto.NoResultsError)

  """
  def get_static_tuesday!(id), do: Repo.get!(StaticTuesday, id)

  @doc """
  Creates a static_tuesday.

  ## Examples

      iex> create_static_tuesday(%{field: value})
      {:ok, %StaticTuesday{}}

      iex> create_static_tuesday(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_static_tuesday(attrs \\ %{}) do
    %StaticTuesday{}
    |> StaticTuesday.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a static_tuesday.

  ## Examples

      iex> update_static_tuesday(static_tuesday, %{field: new_value})
      {:ok, %StaticTuesday{}}

      iex> update_static_tuesday(static_tuesday, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_static_tuesday(%StaticTuesday{} = static_tuesday, attrs) do
    static_tuesday
    |> StaticTuesday.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a static_tuesday.

  ## Examples

      iex> delete_static_tuesday(static_tuesday)
      {:ok, %StaticTuesday{}}

      iex> delete_static_tuesday(static_tuesday)
      {:error, %Ecto.Changeset{}}

  """
  def delete_static_tuesday(%StaticTuesday{} = static_tuesday) do
    Repo.delete(static_tuesday)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking static_tuesday changes.

  ## Examples

      iex> change_static_tuesday(static_tuesday)
      %Ecto.Changeset{data: %StaticTuesday{}}

  """
  def change_static_tuesday(%StaticTuesday{} = static_tuesday, attrs \\ %{}) do
    StaticTuesday.changeset(static_tuesday, attrs)
  end
end
