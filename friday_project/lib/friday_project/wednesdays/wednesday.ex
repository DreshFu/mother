defmodule FridayProject.Wednesdays.Wednesday do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wednesdays" do
    field :name, :string
    field :firstname, :string
    belongs_to(:first_dev_experience,
    FridayProject.Fridays.FirstDevExperience)

    timestamps()
  end

  @doc false
  def changeset(wednesday, attrs) do
    wednesday
    |> cast(attrs, [:firstname, :name, :first_dev_experience_id])
    |> foreign_key_constraint(:first_dev_experience_id)
    |> validate_required([:firstname, :name])
  end
end
