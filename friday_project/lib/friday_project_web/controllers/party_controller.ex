defmodule FridayProjectWeb.PartyController do
  use FridayProjectWeb, :controller

  alias FridayProject.WeekEnds
  alias FridayProject.WeekEnds.Party

  def index(conn, _params) do
    parties = WeekEnds.list_parties_with_preload()
    render(conn, :index, parties: parties)
  end

  def new(conn, _params) do
    changeset = WeekEnds.change_party(%Party{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"party" => party_params}) do
    case WeekEnds.create_party(party_params) do
      {:ok, party} ->
        conn
        |> put_flash(:info, "Party created successfully.")
        |> redirect(to: ~p"/parties/#{party}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    party = WeekEnds.get_party_with_preload!(id)
    render(conn, :show, party: party)
  end

  def edit(conn, %{"id" => id}) do
    party = WeekEnds.get_party_with_preload!(id)
    changeset = WeekEnds.change_party(party)
    render(conn, :edit, party: party, changeset: changeset)
  end

  def update(conn, %{"id" => id, "party" => party_params}) do
    party = WeekEnds.get_party!(id)

    case WeekEnds.update_party(party, party_params) do
      {:ok, party} ->
        conn
        |> put_flash(:info, "Party updated successfully.")
        |> redirect(to: ~p"/parties/#{party}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, party: party, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    party = WeekEnds.get_party!(id)
    {:ok, _party} = WeekEnds.delete_party(party)

    conn
    |> put_flash(:info, "Party deleted successfully.")
    |> redirect(to: ~p"/parties")
  end
end
