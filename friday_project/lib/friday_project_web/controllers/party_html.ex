defmodule FridayProjectWeb.PartyHTML do
  use FridayProjectWeb, :html

  embed_templates "party_html/*"

  @doc """
  Renders a party form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def party_form(assigns)
end
