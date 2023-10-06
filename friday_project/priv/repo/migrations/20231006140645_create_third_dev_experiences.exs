defmodule FridayProject.Repo.Migrations.CreateThirdDevExperiences do
  use Ecto.Migration

  def change do
    create table(:third_dev_experiences) do
      add :name, :string
      add :description, :string
      add :nb_thing, :integer

      timestamps()
    end
  end
end
