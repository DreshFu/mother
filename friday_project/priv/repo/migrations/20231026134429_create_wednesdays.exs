defmodule FridayProject.Repo.Migrations.CreateWednesdays do
  use Ecto.Migration

  def change do
    create table(:wednesdays) do
      add :firstname, :string
      add :name, :string
      add :first_dev_experience_id, references(:first_dev_experiences, on_delete: :nothing)

      timestamps()
    end

    create index(:wednesdays, [:first_dev_experience_id])
  end
end
