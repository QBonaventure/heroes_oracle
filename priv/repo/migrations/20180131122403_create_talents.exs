defmodule HeroesOracle.Repo.Migrations.CreateTalents do
  use Ecto.Migration

  def change do
    create table(:talents) do
      add :name, :string
      add :level, :integer
      add :description, :string
      add :hero_id, references(:heroes, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:talents, [:hero_id])

  end
end
