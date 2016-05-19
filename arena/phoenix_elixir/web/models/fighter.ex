defmodule PhoenixElixir.Fighter do
  use PhoenixElixir.Web, :model

  schema "fighters" do
    field :name, :string
    field :lvl, :integer
    field :race, :string
    field :klass, :string
    field :wins, :integer
  end

  @required_fields ~w(name lvl race klass wins)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
