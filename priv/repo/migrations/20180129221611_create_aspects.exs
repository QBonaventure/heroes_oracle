defmodule HeroesOracle.Repo.Migrations.CreateAspects do
  use Ecto.Migration

  def change do
    create table(:aspects) do

      timestamps()
    end

  end
end
