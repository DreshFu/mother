defmodule FridayProjectWeb.TuesdayLive.FormComponent do
  use FridayProjectWeb, :live_component

  alias FridayProject.Tuesdays

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage tuesday records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="tuesday-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:nb_thing]} type="number" label="Nb thing" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Tuesday</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{tuesday: tuesday} = assigns, socket) do
    changeset = Tuesdays.change_tuesday(tuesday)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"tuesday" => tuesday_params}, socket) do
    changeset =
      socket.assigns.tuesday
      |> Tuesdays.change_tuesday(tuesday_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"tuesday" => tuesday_params}, socket) do
    save_tuesday(socket, socket.assigns.action, tuesday_params)
  end

  defp save_tuesday(socket, :edit, tuesday_params) do
    case Tuesdays.update_tuesday(socket.assigns.tuesday, tuesday_params) do
      {:ok, tuesday} ->
        notify_parent({:saved, tuesday})

        {:noreply,
         socket
         |> put_flash(:info, "Tuesday updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_tuesday(socket, :new, tuesday_params) do
    case Tuesdays.create_tuesday(tuesday_params) do
      {:ok, tuesday} ->
        notify_parent({:saved, tuesday})

        {:noreply,
         socket
         |> put_flash(:info, "Tuesday created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
