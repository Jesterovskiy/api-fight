defmodule PhoenixElixir.Repo.Migrations.CreateFighter do
  use Ecto.Migration

  def change do
    create table(:fighters) do
      add :name, :string
      add :lvl, :integer
      add :race, :string
      add :klass, :string
      add :wins, :integer

      timestamps()
    end

  end
end
