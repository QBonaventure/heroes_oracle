defmodule HeroesOracleWeb.AspectController do
  use HeroesOracleWeb, :controller

  alias HeroesOracle.Heroes
  alias HeroesOracle.Heroes.Hero
  alias HeroesOracle.Heroes.Aspect
  alias HeroesOracle.Repo


  # def index(conn, %{"hero_id" => hero_id}) do
  #   hero = Heroes.get_hero!(hero_id)
  #   render(conn, "index.html", hero: hero)
  # end
  def index(conn, %{"hero_id" => hero_id}) do
    # hero = Heroes.get_hero!(hero_id)
    hero = Hero
    |> Repo.get!(hero_id)
    |> Repo.preload(:aspects)
    # heroes_aspect = Heroes.list_heroes_aspect()
    render(conn, "index.html", hero: hero)
  end

  def new(conn, %{"hero_id" => hero_id}) do
    hero = Repo.get!(Hero, hero_id)
    changeset = Heroes.change_heroes_aspects(%Aspect{})
    render(conn, "new.html", changeset: changeset, hero: hero)
  end

  def create(conn, %{"heroes_aspect" => heroes_aspect_params}) do
    case Heroes.create_heroes_aspect(heroes_aspect_params) do
      {:ok, heroes_aspect} ->
        conn
        |> put_flash(:info, "Heroes Aspect created successfully.")
        |> redirect(to: hero_aspect_path(conn, :show, heroes_aspect))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    heroes_aspect = Heroes.get_heroes_aspect!(id)
    render(conn, "show.html", heroes_aspect: heroes_aspect)
  end

  def edit(conn, %{"id" => id}) do
    heroes_aspect = Heroes.get_heroes_aspect!(id)
    changeset = Heroes.change_heroes_aspect(heroes_aspect)
    render(conn, "edit.html", heroes_aspect: heroes_aspect, changeset: changeset)
  end

  def update(conn, %{"id" => id, "heroes_aspect" => heroes_aspect_params}) do
    heroes_aspect = Heroes.get_heroes_aspect!(id)

    case Heroes.update_heroes_aspect(heroes_aspect, heroes_aspect_params) do
      {:ok, heroes_aspect} ->
        conn
        |> put_flash(:info, "Heroes Aspect updated successfully.")
        |> redirect(to: hero_aspect_path(conn, :show, heroes_aspect))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", heroes_aspect: heroes_aspect, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    heroes_aspect = Heroes.get_heroes_aspect!(id)
    {:ok, _heroes_aspect} = Heroes.delete_heroes_aspect(heroes_aspect)

    conn
    |> put_flash(:info, "Heroes Aspect deleted successfully.")
    |> redirect(to: hero_aspect_path(conn, :index, 4))
  end
end
