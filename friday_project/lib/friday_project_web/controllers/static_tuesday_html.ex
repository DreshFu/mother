defmodule FridayProjectWeb.StaticTuesdayHTML do
  use FridayProjectWeb, :html

  embed_templates "static_tuesday_html/*"

  @doc """
  Renders a static_tuesday form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def static_tuesday_form(assigns)
end
