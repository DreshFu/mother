defmodule FridayProjectWeb.ThirdDevExperienceHTML do
  use FridayProjectWeb, :html

  embed_templates "third_dev_experience_html/*"

  @doc """
  Renders a third_dev_experience form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def third_dev_experience_form(assigns)
end
