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
    |> Repo.preload(:talents)
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
    |> Repo.preload(:talents)
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

  @doc """
  Returns the list of talents.

  ## Examples

      iex> list_talents()
      [%Talent{}, ...]

  """
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

  alias HeroesOracle.Heroes.RefAspectType

  @doc """
  Returns the list of ref_aspects_types.

  ## Examples

      iex> list_ref_aspects_types()
      [%RefAspectType{}, ...]

  """
  def list_ref_aspects_types do
    Repo.all(RefAspectType)
  end

  @doc """
  Gets a single ref_aspect_type.

  Raises `Ecto.NoResultsError` if the Ref aspect type does not exist.

  ## Examples

      iex> get_ref_aspect_type!(123)
      %RefAspectType{}

      iex> get_ref_aspect_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ref_aspect_type!(id), do: Repo.get!(RefAspectType, id)

  @doc """
  Creates a ref_aspect_type.

  ## Examples

      iex> create_ref_aspect_type(%{field: value})
      {:ok, %RefAspectType{}}

      iex> create_ref_aspect_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ref_aspect_type(attrs \\ %{}) do
    %RefAspectType{}
    |> RefAspectType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ref_aspect_type.

  ## Examples

      iex> update_ref_aspect_type(ref_aspect_type, %{field: new_value})
      {:ok, %RefAspectType{}}

      iex> update_ref_aspect_type(ref_aspect_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ref_aspect_type(%RefAspectType{} = ref_aspect_type, attrs) do
    ref_aspect_type
    |> RefAspectType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a RefAspectType.

  ## Examples

      iex> delete_ref_aspect_type(ref_aspect_type)
      {:ok, %RefAspectType{}}

      iex> delete_ref_aspect_type(ref_aspect_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ref_aspect_type(%RefAspectType{} = ref_aspect_type) do
    Repo.delete(ref_aspect_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ref_aspect_type changes.

  ## Examples

      iex> change_ref_aspect_type(ref_aspect_type)
      %Ecto.Changeset{source: %RefAspectType{}}

  """
  def change_ref_aspect_type(%RefAspectType{} = ref_aspect_type) do
    RefAspectType.changeset(ref_aspect_type, %{})
  end

  alias HeroesOracle.Heroes.RefAspectValue

  @doc """
  Returns the list of aspects_values.

  ## Examples

      iex> list_aspects_values()
      [%AspectValue{}, ...]

  """
  def list_aspects_values do
    Repo.all(RefAspectValue)
  end

  @doc """
  Gets a single aspect_value.

  Raises `Ecto.NoResultsError` if the Aspect value does not exist.

  ## Examples

      iex> get_aspect_value!(123)
      %AspectValue{}

      iex> get_aspect_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aspect_value!(id), do: Repo.get!(RefAspectValue, id)

  @doc """
  Creates a aspect_value.

  ## Examples

      iex> create_aspect_value(%{field: value})
      {:ok, %AspectValue{}}

      iex> create_aspect_value(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aspect_value(attrs \\ %{}) do
    %RefAspectValue{}
    |> RefAspectValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aspect_value.

  ## Examples

      iex> update_aspect_value(aspect_value, %{field: new_value})
      {:ok, %AspectValue{}}

      iex> update_aspect_value(aspect_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aspect_value(%RefAspectValue{} = aspect_value, attrs) do
    aspect_value
    |> RefAspectValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AspectValue.

  ## Examples

      iex> delete_aspect_value(aspect_value)
      {:ok, %AspectValue{}}

      iex> delete_aspect_value(aspect_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aspect_value(%RefAspectValue{} = aspect_value) do
    Repo.delete(aspect_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aspect_value changes.

  ## Examples

      iex> change_aspect_value(aspect_value)
      %Ecto.Changeset{source: %AspectValue{}}

  """
  def change_aspect_value(%RefAspectValue{} = aspect_value) do
    RefAspectValue.changeset(aspect_value, %{})
  end

  alias HeroesOracle.Heroes.Aspect

  @doc """
  Returns the list of heroes_aspects.

  ## Examples

      iex> list_heroes_aspects()
      [%Aspect{}, ...]

  """
  def list_heroes_aspects do
    Repo.all(Aspect)
  end

  @doc """
  Gets a single heroes_aspects.

  Raises `Ecto.NoResultsError` if the Heroes aspects does not exist.

  ## Examples

      iex> get_heroes_aspects!(123)
      %Aspects{}

      iex> get_heroes_aspects!(456)
      ** (Ecto.NoResultsError)

  """
  def get_heroes_aspects!(id), do: Repo.get!(Aspect, id)

  @doc """
  Creates a heroes_aspects.

  ## Examples

      iex> create_heroes_aspects(%{field: value})
      {:ok, %Aspects{}}

      iex> create_heroes_aspects(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_heroes_aspects(attrs \\ %{}) do
    %Aspect{}
    |> Aspect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a heroes_aspects.

  ## Examples

      iex> update_heroes_aspects(heroes_aspects, %{field: new_value})
      {:ok, %Aspects{}}

      iex> update_heroes_aspects(heroes_aspects, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_heroes_aspects(%Aspect{} = heroes_aspects, attrs) do
    heroes_aspects
    |> Aspect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Aspects.

  ## Examples

      iex> delete_heroes_aspects(heroes_aspects)
      {:ok, %Aspects{}}

      iex> delete_heroes_aspects(heroes_aspects)
      {:error, %Ecto.Changeset{}}

  """
  def delete_heroes_aspects(%Aspect{} = heroes_aspects) do
    Repo.delete(heroes_aspects)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking heroes_aspects changes.

  ## Examples

      iex> change_heroes_aspects(heroes_aspects)
      %Ecto.Changeset{source: %Aspects{}}

  """
  def change_heroes_aspects(%Aspect{} = heroes_aspects) do
    Aspect.changeset(heroes_aspects, %{})
  end
end
