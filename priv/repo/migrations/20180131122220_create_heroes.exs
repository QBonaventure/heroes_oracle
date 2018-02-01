defmodule HeroesOracle.Repo.Migrations.CreateHeroes do
  use Ecto.Migration

  def change do
    create table(:heroes) do
      add :name, :string
      add :role_id, references(:ref_heroes_roles), null: false
      add :type_id, references(:ref_heroes_types), null: false

      timestamps()
    end

  end
end
