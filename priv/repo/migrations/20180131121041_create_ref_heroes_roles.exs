defmodule HeroesOracle.Repo.Migrations.CreateRefHeroesRoles do
  use Ecto.Migration

  def change do
    create table(:ref_heroes_roles) do
      add :name, :string
    end

    flush()
  end
end
