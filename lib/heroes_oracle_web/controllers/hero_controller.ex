defmodule HeroesOracleWeb.HeroController do
  use HeroesOracleWeb, :controller

  alias HeroesOracle.Heroes
  alias HeroesOracle.Heroes.{Hero, HeroType}
  alias HeroesOracle.Repo

  def index(conn, _params) do
    heroes = Heroes.list_heroes()
    render(conn, "index.html", heroes: heroes)
  end

  def get_heroes_types_opts do
    heroes_types = Heroes.list_heroes_types()
    |> Enum.map(&{&1.name, &1.id})
  end

  def get_heroes_roles_opts do
    heroes_roles = Heroes.list_heroes_roles()
    |> Enum.map(&{&1.name, &1.id})
  end

  def new(conn, _params) do
    changeset = Heroes.change_hero(%Hero{})
    render(conn, "new.html",
      changeset: changeset,
      heroes_types: get_heroes_types_opts,
      heroes_roles: get_heroes_roles_opts)
  end

  def create(conn, %{"hero" => hero_params}) do
    case Heroes.create_hero(hero_params) do
      {:ok, hero} ->
        conn
        |> put_flash(:info, "Hero created successfully.")
        |> redirect(to: hero_path(conn, :show, hero))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html",
          changeset: changeset,
          heroes_types: get_heroes_types_opts,
          heroes_roles: get_heroes_roles_opts)
    end
  end

  def show(conn, %{"id" => id}) do
    hero = Heroes.get_hero!(id)
    render(conn, "show.html", hero: hero)
  end

  def edit(conn, %{"id" => id}) do
    hero = Heroes.get_hero!(id)
    changeset = Heroes.change_hero(hero)
    render(conn, "edit.html", hero: hero, changeset: changeset,
    heroes_types: get_heroes_types_opts,
    heroes_roles: get_heroes_roles_opts)
  end

  def update(conn, %{"id" => id, "hero" => hero_params}) do
    hero = Heroes.get_hero!(id)

    case Heroes.update_hero(hero, hero_params) do
      {:ok, hero} ->
        conn
        |> put_flash(:info, "Hero updated successfully.")
        |> redirect(to: hero_path(conn, :show, hero))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", hero: hero, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hero = Heroes.get_hero!(id)
    {:ok, _hero} = Heroes.delete_hero(hero)

    conn
    |> put_flash(:info, "Hero deleted successfully.")
    |> redirect(to: hero_path(conn, :index))
  end
end
