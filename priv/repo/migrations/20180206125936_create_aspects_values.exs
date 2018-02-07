defmodule HeroesOracle.Repo.Migrations.CreateAspectsValues do
  use Ecto.Migration

  def change do
    create table(:ref_aspects_values) do
      add :value_string_id, references(:strings, on_delete: :nothing)
      add :aspect_type_id, references(:ref_aspects_types, on_delete: :nothing)
    end

    create index(:ref_aspects_values, [:aspect_type_id])
  end
end
