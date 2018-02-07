defmodule HeroesOracle.Common do
  @moduledoc """
  The Common context.
  """

  import Ecto.Query, warn: false
  alias HeroesOracle.Repo

  alias HeroesOracle.Common.String

  @doc """
  Returns the list of strings.

  ## Examples

      iex> list_strings()
      [%String{}, ...]

  """
  def list_strings do
    Repo.all(String)
  end

  @doc """
  Gets a single string.

  Raises `Ecto.NoResultsError` if the String does not exist.

  ## Examples

      iex> get_string!(123)
      %String{}

      iex> get_string!(456)
      ** (Ecto.NoResultsError)

  """
  def get_string!(id), do: Repo.get!(String, id)

  @doc """
  Creates a string.

  ## Examples

      iex> create_string(%{field: value})
      {:ok, %String{}}

      iex> create_string(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_string(attrs \\ %{}) do
    %String{}
    |> String.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a string.

  ## Examples

      iex> update_string(string, %{field: new_value})
      {:ok, %String{}}

      iex> update_string(string, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_string(%String{} = string, attrs) do
    string
    |> String.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a String.

  ## Examples

      iex> delete_string(string)
      {:ok, %String{}}

      iex> delete_string(string)
      {:error, %Ecto.Changeset{}}

  """
  def delete_string(%String{} = string) do
    Repo.delete(string)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking string changes.

  ## Examples

      iex> change_string(string)
      %Ecto.Changeset{source: %String{}}

  """
  def change_string(%String{} = string) do
    String.changeset(string, %{})
  end
end
