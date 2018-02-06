defmodule HeroesOracle.Repo.Migrations.CreateRefHeroesTypes do
  use Ecto.Migration

  def change do
    create table(:ref_heroes_types) do
      add :name, :string
    end

    flush()
  end
end
