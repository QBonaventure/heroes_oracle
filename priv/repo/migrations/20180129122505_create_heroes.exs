defmodule HeroesOracle.Repo.Migrations.CreateHeroes do
  use Ecto.Migration

  def change do
    create table(:heroes) do
      add :name, :string

      timestamps()
    end

  end
end
