defmodule HeroesOracleWeb.TalentController do
  use HeroesOracleWeb, :controller

  alias HeroesOracle.Heroes
  alias HeroesOracle.Heroes.Talent

  def index(conn, %{"hero_id" => hero_id}) do
    hero = Heroes.get_hero!(hero_id)
    render(conn, "index.html", hero: hero)
  end

  def new(conn, %{"hero_id" => hero_id}) do
    changeset = Heroes.change_talent(%Talent{})
    hero = Heroes.get_hero!(hero_id)

    render(conn, "new.html", changeset: changeset, hero: hero)
  end

  def create(conn, %{"talent" => talent_params, "hero_id" => hero_id}) do
    talent_params = Map.put(talent_params, "hero_id", hero_id)
    case Heroes.create_talent(talent_params) do
      {:ok, talent} ->
        conn
        |> put_flash(:info, "Talent created successfully.")
        |> redirect(to: hero_talent_path(conn, :show, hero_id, talent))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    talent = Heroes.get_talent!(id)
    render(conn, "show.html", talent: talent)
  end

  def edit(conn, %{"id" => id}) do
    talent = Heroes.get_talent!(id)
    changeset = Heroes.change_talent(talent)
    render(conn, "edit.html", talent: talent, changeset: changeset)
  end

  def update(conn, %{"id" => id, "talent" => talent_params}) do
    talent = Heroes.get_talent!(id)

    case Heroes.update_talent(talent, talent_params) do
      {:ok, talent} ->
        conn
        |> put_flash(:info, "Talent updated successfully.")
        |> redirect(to: hero_talent_path(conn, :show, talent.hero_id, talent))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", talent: talent, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    talent = Heroes.get_talent!(id)
    {:ok, _talent} = Heroes.delete_talent(talent)

    conn
    |> put_flash(:info, "Talent deleted successfully.")
    |> redirect(to: hero_talent_path(conn, :index, :hero_index))
  end
end
