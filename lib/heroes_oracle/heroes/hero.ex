defmodule HeroesOracle.Heroes.Hero do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.Hero


  schema "heroes" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Hero{} = hero, attrs) do
    hero
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
