defmodule FridayProject.Repo.Migrations.CreateTuesdays do
  use Ecto.Migration

  def change do
    create table(:tuesdays) do
      add :name, :string
      add :description, :string
      add :nb_thing, :integer

      timestamps()
    end
  end
end
