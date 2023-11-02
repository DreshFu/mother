defmodule FridayProject.StaticTuesdays.StaticTuesday do
  use Ecto.Schema
  import Ecto.Changeset

  schema "statictuesdays" do
    field :name, :string
    field :description, :string
    field :nb_thing, :integer

    timestamps()
  end

  @doc false
  def changeset(static_tuesday, attrs) do
    static_tuesday
    |> cast(attrs, [:name, :description, :nb_thing])
    |> validate_required([:name, :description, :nb_thing])
  end
end
