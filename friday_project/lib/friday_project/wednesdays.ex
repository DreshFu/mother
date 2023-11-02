defmodule FridayProject.Wednesdays do
  @moduledoc """
  The Wednesdays context.
  """

  import Ecto.Query, warn: false
  alias FridayProject.Repo

  alias FridayProject.Wednesdays.Wednesday

  @doc """
  Returns the list of wednesdays.

  ## Examples

      iex> list_wednesdays()
      [%Wednesday{}, ...]

  """
  def list_wednesdays do
    Repo.all(Wednesday)
  end

  def list_wednesdays_with_preload do
    Wednesday
    |> Repo.all()
    |> Repo.preload(:first_dev_experience)
  end

  @doc """
  Gets a single wednesday.

  Raises `Ecto.NoResultsError` if the Wednesday does not exist.

  ## Examples

      iex> get_wednesday!(123)
      %Wednesday{}

      iex> get_wednesday!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wednesday!(id), do: Repo.get!(Wednesday, id)
  def get_wednesday_with_preload!(id), do: Repo.get!(Wednesday, id)
  |> Repo.preload(:first_dev_experience)

  @doc """
  Creates a wednesday.

  ## Examples

      iex> create_wednesday(%{field: value})
      {:ok, %Wednesday{}}

      iex> create_wednesday(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wednesday(attrs \\ %{}) do
    %Wednesday{}
    |> Wednesday.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wednesday.

  ## Examples

      iex> update_wednesday(wednesday, %{field: new_value})
      {:ok, %Wednesday{}}

      iex> update_wednesday(wednesday, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wednesday(%Wednesday{} = wednesday, attrs) do
    wednesday
    |> Wednesday.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wednesday.

  ## Examples

      iex> delete_wednesday(wednesday)
      {:ok, %Wednesday{}}

      iex> delete_wednesday(wednesday)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wednesday(%Wednesday{} = wednesday) do
    Repo.delete(wednesday)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wednesday changes.

  ## Examples

      iex> change_wednesday(wednesday)
      %Ecto.Changeset{data: %Wednesday{}}

  """
  def change_wednesday(%Wednesday{} = wednesday, attrs \\ %{}) do
    Wednesday.changeset(wednesday, attrs)
  end
end
