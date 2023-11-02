defmodule FridayProject.Tuesdays do
  @moduledoc """
  The Tuesdays context.
  """

  import Ecto.Query, warn: false
  alias FridayProject.Repo

  alias FridayProject.Tuesdays.Tuesday

  @doc """
  Returns the list of tuesdays.

  ## Examples

      iex> list_tuesdays()
      [%Tuesday{}, ...]

  """
  def list_tuesdays do
    Repo.all(Tuesday)
  end

  @doc """
  Gets a single tuesday.

  Raises `Ecto.NoResultsError` if the Tuesday does not exist.

  ## Examples

      iex> get_tuesday!(123)
      %Tuesday{}

      iex> get_tuesday!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tuesday!(id), do: Repo.get!(Tuesday, id)

  @doc """
  Creates a tuesday.

  ## Examples

      iex> create_tuesday(%{field: value})
      {:ok, %Tuesday{}}

      iex> create_tuesday(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tuesday(attrs \\ %{}) do
    %Tuesday{}
    |> Tuesday.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tuesday.

  ## Examples

      iex> update_tuesday(tuesday, %{field: new_value})
      {:ok, %Tuesday{}}

      iex> update_tuesday(tuesday, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tuesday(%Tuesday{} = tuesday, attrs) do
    tuesday
    |> Tuesday.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tuesday.

  ## Examples

      iex> delete_tuesday(tuesday)
      {:ok, %Tuesday{}}

      iex> delete_tuesday(tuesday)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tuesday(%Tuesday{} = tuesday) do
    Repo.delete(tuesday)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tuesday changes.

  ## Examples

      iex> change_tuesday(tuesday)
      %Ecto.Changeset{data: %Tuesday{}}

  """
  def change_tuesday(%Tuesday{} = tuesday, attrs \\ %{}) do
    Tuesday.changeset(tuesday, attrs)
  end
end
