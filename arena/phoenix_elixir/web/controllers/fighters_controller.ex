defmodule PhoenixElixir.FightersController do
  use PhoenixElixir.Web, :controller

  def index(conn, _params) do
    render conn, fighters: [%{name: "John Doe"}, %{name: "Foo Bar"}, %{name: "Sir Gey"}]
  end
end
