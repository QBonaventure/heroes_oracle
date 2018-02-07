defmodule HeroesOracle.Repo.Migrations.CreateStrings do
  use Ecto.Migration

  def change do
    create table(:strings) do
      add :string, :string
    end

  end
end
