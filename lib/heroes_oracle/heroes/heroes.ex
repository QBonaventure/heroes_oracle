defmodule HeroesOracle.Heroes do
  @moduledoc """
  The Heroes context.
  """

  import Ecto.Query, warn: false
  alias HeroesOracle.Repo

  alias HeroesOracle.Heroes.Hero

  @doc """
  Returns the list of heroes.

  ## Examples

      iex> list_heroes()
      [%Hero{}, ...]

  """
  def list_heroes do
    Repo.all(Hero)
  end

  @doc """
  Gets a single hero.

  Raises `Ecto.NoResultsError` if the Hero does not exist.

  ## Examples

      iex> get_hero!(123)
      %Hero{}

      iex> get_hero!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hero!(id), do: Repo.get!(Hero, id)

  @doc """
  Creates a hero.

  ## Examples

      iex> create_hero(%{field: value})
      {:ok, %Hero{}}

      iex> create_hero(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hero(attrs \\ %{}) do
    %Hero{}
    |> Hero.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hero.

  ## Examples

      iex> update_hero(hero, %{field: new_value})
      {:ok, %Hero{}}

      iex> update_hero(hero, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hero(%Hero{} = hero, attrs) do
    hero
    |> Hero.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hero.

  ## Examples

      iex> delete_hero(hero)
      {:ok, %Hero{}}

      iex> delete_hero(hero)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hero(%Hero{} = hero) do
    Repo.delete(hero)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hero changes.

  ## Examples

      iex> change_hero(hero)
      %Ecto.Changeset{source: %Hero{}}

  """
  def change_hero(%Hero{} = hero) do
    Hero.changeset(hero, %{})
  end
end
