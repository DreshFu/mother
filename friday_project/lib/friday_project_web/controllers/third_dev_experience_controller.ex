defmodule FridayProjectWeb.ThirdDevExperienceController do
  use FridayProjectWeb, :controller

  alias FridayProject.Fridays
  alias FridayProject.Fridays.ThirdDevExperience

  def index(conn, _params) do
    third_dev_experiences = Fridays.list_third_dev_experiences()
    render(conn, :index, third_dev_experiences: third_dev_experiences)
  end

  def new(conn, _params) do
    changeset = Fridays.change_third_dev_experience(%ThirdDevExperience{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"third_dev_experience" => third_dev_experience_params}) do
    case Fridays.create_third_dev_experience(third_dev_experience_params) do
      {:ok, third_dev_experience} ->
        conn
        |> put_flash(:info, "Third dev experience created successfully.")
        |> redirect(to: ~p"/third_dev_experiences/#{third_dev_experience}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    third_dev_experience = Fridays.get_third_dev_experience!(id)
    render(conn, :show, third_dev_experience: third_dev_experience)
  end

  def edit(conn, %{"id" => id}) do
    third_dev_experience = Fridays.get_third_dev_experience!(id)
    changeset = Fridays.change_third_dev_experience(third_dev_experience)
    render(conn, :edit, third_dev_experience: third_dev_experience, changeset: changeset)
  end

  def update(conn, %{"id" => id, "third_dev_experience" => third_dev_experience_params}) do
    third_dev_experience = Fridays.get_third_dev_experience!(id)

    case Fridays.update_third_dev_experience(third_dev_experience, third_dev_experience_params) do
      {:ok, third_dev_experience} ->
        conn
        |> put_flash(:info, "Third dev experience updated successfully.")
        |> redirect(to: ~p"/third_dev_experiences/#{third_dev_experience}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, third_dev_experience: third_dev_experience, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    third_dev_experience = Fridays.get_third_dev_experience!(id)
    {:ok, _third_dev_experience} = Fridays.delete_third_dev_experience(third_dev_experience)

    conn
    |> put_flash(:info, "Third dev experience deleted successfully.")
    |> redirect(to: ~p"/third_dev_experiences")
  end
end
