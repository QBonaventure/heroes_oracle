defmodule HeroesOracle.Repo.Migrations.CreateRefHeroesRoles do
  use Ecto.Migration

  def change do
    create table(:ref_heroes_roles) do
      add :name, :string
    end

    flush()
    execute "insert into ref_heroes_roles (name) values ('tank')"
    execute "insert into ref_heroes_roles (name) values ('assassin')"
    execute "insert into ref_heroes_roles (name) values ('support')"
    execute "insert into ref_heroes_roles (name) values ('specialist')"
    execute "insert into ref_heroes_roles (name) values ('multiclass')"
  end
end
