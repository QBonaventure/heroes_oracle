defmodule HeroesOracle.Repo.Migrations.CreateRefHeroesTypes do
  use Ecto.Migration

  def change do
    create table(:ref_heroes_types) do
      add :name, :string
    end

    flush()
    execute "insert into ref_heroes_types (name) values ('tank')"
    execute "insert into ref_heroes_types (name) values ('bruiser')"
    execute "insert into ref_heroes_types (name) values ('healer')"
    execute "insert into ref_heroes_types (name) values ('support')"
    execute "insert into ref_heroes_types (name) values ('ambusher')"
    execute "insert into ref_heroes_types (name) values ('burst damage')"
    execute "insert into ref_heroes_types (name) values ('sustained damage')"
    execute "insert into ref_heroes_types (name) values ('siege')"
    execute "insert into ref_heroes_types (name) values ('utility')"
  end
end
