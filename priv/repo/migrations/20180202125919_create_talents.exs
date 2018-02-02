defmodule HeroesOracle.Repo.Migrations.CreateTalents do
  use Ecto.Migration

  def change do
    create table(:talents) do
      add :level, :integer
      add :name, :string
      add :description, :text
      add :hero_id, references(:heroes, on_delete: :nothing)

      timestamps()
    end

    create index(:talents, [:hero_id])
  end
end
