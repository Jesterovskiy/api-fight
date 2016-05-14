defmodule PhoenixElixir.FightersView do
  use PhoenixElixir.Web, :view

  def render("index.json", %{fighters: fighters}) do
    fighters
  end
end
