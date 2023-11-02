defmodule FridayProjectWeb.TuesdayLive.Index do
  use FridayProjectWeb, :live_view

  alias FridayProject.Tuesdays
  alias FridayProject.Tuesdays.Tuesday

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tuesdays, Tuesdays.list_tuesdays())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Tuesday")
    |> assign(:tuesday, Tuesdays.get_tuesday!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Tuesday")
    |> assign(:tuesday, %Tuesday{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tuesdays")
    |> assign(:tuesday, nil)
  end

  @impl true
  def handle_info({FridayProjectWeb.TuesdayLive.FormComponent, {:saved, tuesday}}, socket) do
    {:noreply, stream_insert(socket, :tuesdays, tuesday)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    tuesday = Tuesdays.get_tuesday!(id)
    {:ok, _} = Tuesdays.delete_tuesday(tuesday)

    {:noreply, stream_delete(socket, :tuesdays, tuesday)}
  end
end
