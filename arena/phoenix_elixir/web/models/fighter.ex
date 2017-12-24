defmodule PhoenixElixir.Fighter do
  use PhoenixElixir.Web, :model

  schema "fighters" do
    field :name, :string
    field :lvl, :integer
    field :race, :string
    field :klass, :string
    field :wins, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :lvl, :race, :klass, :wins])
    |> validate_required([:name, :lvl, :race, :klass, :wins])
  end
end
