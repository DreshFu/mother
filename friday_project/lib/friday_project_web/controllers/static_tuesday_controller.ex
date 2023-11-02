defmodule FridayProjectWeb.StaticTuesdayController do
  use FridayProjectWeb, :controller

  alias FridayProject.StaticTuesdays
  alias FridayProject.StaticTuesdays.StaticTuesday

  def index(conn, _params) do
    statictuesdays = StaticTuesdays.list_statictuesdays()
    render(conn, :index, statictuesdays: statictuesdays)
  end

  def new(conn, _params) do
    changeset = StaticTuesdays.change_static_tuesday(%StaticTuesday{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"static_tuesday" => static_tuesday_params}) do
    case StaticTuesdays.create_static_tuesday(static_tuesday_params) do
      {:ok, static_tuesday} ->
        conn
        |> put_flash(:info, "Static tuesday created successfully.")
        |> redirect(to: ~p"/statictuesdays/#{static_tuesday}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    static_tuesday = StaticTuesdays.get_static_tuesday!(id)
    render(conn, :show, static_tuesday: static_tuesday)
  end

  def edit(conn, %{"id" => id}) do
    static_tuesday = StaticTuesdays.get_static_tuesday!(id)
    changeset = StaticTuesdays.change_static_tuesday(static_tuesday)
    render(conn, :edit, static_tuesday: static_tuesday, changeset: changeset)
  end

  def update(conn, %{"id" => id, "static_tuesday" => static_tuesday_params}) do
    static_tuesday = StaticTuesdays.get_static_tuesday!(id)

    case StaticTuesdays.update_static_tuesday(static_tuesday, static_tuesday_params) do
      {:ok, static_tuesday} ->
        conn
        |> put_flash(:info, "Static tuesday updated successfully.")
        |> redirect(to: ~p"/statictuesdays/#{static_tuesday}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, static_tuesday: static_tuesday, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    static_tuesday = StaticTuesdays.get_static_tuesday!(id)
    {:ok, _static_tuesday} = StaticTuesdays.delete_static_tuesday(static_tuesday)

    conn
    |> put_flash(:info, "Static tuesday deleted successfully.")
    |> redirect(to: ~p"/statictuesdays")
  end
end
