defmodule FridayProject.Tuesdays.Tuesday do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tuesdays" do
    field :name, :string
    field :description, :string
    field :nb_thing, :integer

    timestamps()
  end

  @doc false
  def changeset(tuesday, attrs) do
    tuesday
    |> cast(attrs, [:name, :description, :nb_thing])
    |> validate_required([:name, :description, :nb_thing])
  end
end
