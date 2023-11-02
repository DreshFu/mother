defmodule FridayProjectWeb.WednesdayController do
  use FridayProjectWeb, :controller

  alias FridayProject.Wednesdays
  alias FridayProject.Wednesdays.Wednesday
  alias FridayProject.Fridays

  def index(conn, _params) do
    wednesdays = Wednesdays.list_wednesdays_with_preload()
    |> IO.inspect(label: "coucou")
    render(conn, :index, wednesdays: wednesdays)
  end

  def new(conn, _params) do
    first_dev_experiences_tuple = Fridays.list_first_dev_experiences()
    |> Enum.map(fn elem -> {"#{elem.name} - #{elem.description} : #{elem.nb_thing}", elem.id} end)

    changeset = Wednesdays.change_wednesday(%Wednesday{})
    render(conn, :new, changeset: changeset, first_dev_experiences_tuple: first_dev_experiences_tuple)
  end

  def create(conn, %{"wednesday" => wednesday_params}) do
    case Wednesdays.create_wednesday(wednesday_params) do
      {:ok, wednesday} ->
        conn
        |> put_flash(:info, "Wednesday created successfully.")
        |> redirect(to: ~p"/wednesdays/#{wednesday}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    wednesday = Wednesdays.get_wednesday_with_preload!(id)
    render(conn, :show, wednesday: wednesday)
  end

  def edit(conn, %{"id" => id}) do
    wednesday = Wednesdays.get_wednesday_with_preload!(id)
    fd = Fridays.list_first_dev_experiences()
    |> Enum.map(fn elem -> {elem.name, elem.id} end)
    |> IO.inspect(label: "coucou")
    changeset = Wednesdays.change_wednesday(wednesday)
    render(conn, :edit, wednesday: wednesday, changeset: changeset, first_dev_experiences_tuple: fd )
  end

  def update(conn, %{"id" => id, "wednesday" => wednesday_params}) do
    wednesday = Wednesdays.get_wednesday!(id)

    case Wednesdays.update_wednesday(wednesday, wednesday_params) do
      {:ok, wednesday} ->
        conn
        |> put_flash(:info, "Wednesday updated successfully.")
        |> redirect(to: ~p"/wednesdays/#{wednesday}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, wednesday: wednesday, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    wednesday = Wednesdays.get_wednesday!(id)
    {:ok, _wednesday} = Wednesdays.delete_wednesday(wednesday)

    conn
    |> put_flash(:info, "Wednesday deleted successfully.")
    |> redirect(to: ~p"/wednesdays")
  end
end
