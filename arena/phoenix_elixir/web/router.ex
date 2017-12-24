defmodule PhoenixElixir.Router do
  use PhoenixElixir.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", PhoenixElixir do
    pipe_through :api

    resources "/fighters", FighterController
  end
end
