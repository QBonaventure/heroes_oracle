defmodule HeroesOracle.Repo.Migrations.CreateTalents do
  use Ecto.Migration

  def change do
    create table(:talents) do
      add :name, :string
      add :level, :integer
      add :description, :string

      timestamps()
    end

  end
end
