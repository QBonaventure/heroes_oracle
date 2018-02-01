defmodule HeroesOracle.Heroes.HeroType do
  use Ecto.Schema
  import Ecto.Changeset
  # alias HeroesOracle.Heroes.{Hero}


  schema "ref_heroes_types" do
    field :name, :string
  end

  # @doc false
  # def changeset(%Hero{} = hero, attrs) do
  #   hero
  #   |> cast(attrs, [:name])
  #   |> validate_required([:name])
  # end
end
