defmodule HeroesOracle.Repo.Migrations.CreateHeroesAspects do
  use Ecto.Migration

  def change do
    create table(:heroes_aspects) do
      add :aspect_type_id, references(:ref_aspects_types, on_delete: :nothing)
      add :hero_id, references(:heroes, on_delete: :nothing)
      add :aspect_value_id, references(:ref_aspects_values, on_delete: :nothing)
    end

    create index(:heroes_aspects, [:aspect_type_id])
    create index(:heroes_aspects, [:hero_id])
    create index(:heroes_aspects, [:aspect_value_id])
  end
end
