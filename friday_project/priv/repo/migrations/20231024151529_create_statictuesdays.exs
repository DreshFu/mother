defmodule FridayProject.Repo.Migrations.CreateStatictuesdays do
  use Ecto.Migration

  def change do
    create table(:statictuesdays) do
      add :name, :string
      add :description, :string
      add :nb_thing, :integer

      timestamps()
    end
  end
end
