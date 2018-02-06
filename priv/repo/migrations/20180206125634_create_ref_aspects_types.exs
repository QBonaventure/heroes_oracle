defmodule HeroesOracle.Repo.Migrations.CreateRefAspectsTypes do
  use Ecto.Migration

  def change do
    create table(:ref_aspects_types) do
      add :name, :string
    end

  end
end
