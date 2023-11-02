defmodule FridayProjectWeb.WednesdayHTML do
  use FridayProjectWeb, :html

  embed_templates "wednesday_html/*"

  @doc """
  Renders a wednesday form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def wednesday_form(assigns)
end
