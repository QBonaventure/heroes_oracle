defmodule HeroesOracle.Heroes do
  @moduledoc """
  The Heroes context.
  """

  import Ecto.Query, warn: false
  alias HeroesOracle.Repo

  alias HeroesOracle.Heroes.{Hero, HeroType, HeroRole}

  @doc """
  Returns the list of heroes.

  ## Examples

      iex> list_heroes()
      [%Hero{}, ...]

  """
  def list_heroes do
    Hero
    |> Repo.all()
    |> Repo.preload(:role)
    |> Repo.preload(:type)
    # |> Repo.preload(:talents)
    # |> Repo.preload(:aspects)
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
  def get_hero!(id) do
    Hero
    |> Repo.get!(id)
    |> Repo.preload(:role)
    |> Repo.preload(:type)
    # |> Repo.preload(:talents)
    # |> Repo.preload(:aspects)
  end

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


  def list_heroes_roles do
    Repo.all(HeroRole)
  end

  def list_heroes_types do
    Repo.all(HeroType)
  end


  alias HeroesOracle.Heroes.Talent

  def list_talents do
    Repo.all(Talent)
  end

  @doc """
  Gets a single talent.

  Raises `Ecto.NoResultsError` if the Talent does not exist.

  ## Examples

      iex> get_talent!(123)
      %Talent{}

      iex> get_talent!(456)
      ** (Ecto.NoResultsError)

  """
  def get_talent!(id), do: Repo.get!(Talent, id)

  @doc """
  Creates a talent.

  ## Examples

      iex> create_talent(%{field: value})
      {:ok, %Talent{}}

      iex> create_talent(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_talent(attrs \\ %{}) do
    %Talent{}
    |> Talent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a talent.

  ## Examples

      iex> update_talent(talent, %{field: new_value})
      {:ok, %Talent{}}

      iex> update_talent(talent, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_talent(%Talent{} = talent, attrs) do
    talent
    |> Talent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Talent.

  ## Examples

      iex> delete_talent(talent)
      {:ok, %Talent{}}

      iex> delete_talent(talent)
      {:error, %Ecto.Changeset{}}

  """
  def delete_talent(%Talent{} = talent) do
    Repo.delete(talent)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking talent changes.

  ## Examples

      iex> change_talent(talent)
      %Ecto.Changeset{source: %Talent{}}

  """
  def change_talent(%Talent{} = talent) do
    Talent.changeset(talent, %{})
  end

  alias HeroesOracle.Heroes.Aspect

  @doc """
  Returns the list of aspects.

  ## Examples

      iex> list_aspects()
      [%Aspect{}, ...]

  """
  def list_aspects do
    Repo.all(Aspect)
  end

  @doc """
  Gets a single aspect.

  Raises `Ecto.NoResultsError` if the Aspect does not exist.

  ## Examples

      iex> get_aspect!(123)
      %Aspect{}

      iex> get_aspect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aspect!(id), do: Repo.get!(Aspect, id)

  @doc """
  Creates a aspect.

  ## Examples

      iex> create_aspect(%{field: value})
      {:ok, %Aspect{}}

      iex> create_aspect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aspect(attrs \\ %{}) do
    %Aspect{}
    |> Aspect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aspect.

  ## Examples

      iex> update_aspect(aspect, %{field: new_value})
      {:ok, %Aspect{}}

      iex> update_aspect(aspect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aspect(%Aspect{} = aspect, attrs) do
    aspect
    |> Aspect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Aspect.

  ## Examples

      iex> delete_aspect(aspect)
      {:ok, %Aspect{}}

      iex> delete_aspect(aspect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aspect(%Aspect{} = aspect) do
    Repo.delete(aspect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aspect changes.

  ## Examples

      iex> change_aspect(aspect)
      %Ecto.Changeset{source: %Aspect{}}

  """
  def change_aspect(%Aspect{} = aspect) do
    Aspect.changeset(aspect, %{})
  end
end
