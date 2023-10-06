defmodule FridayProject.Fridays.ThirdDevExperience do
  use Ecto.Schema
  import Ecto.Changeset

  schema "third_dev_experiences" do
    field :name, :string
    field :description, :string
    field :nb_thing, :integer

    timestamps()
  end

  @doc false
  def changeset(third_dev_experience, attrs) do
    third_dev_experience
    |> cast(attrs, [:name, :description, :nb_thing])
    |> validate_required([:name, :description, :nb_thing])
  end
end
