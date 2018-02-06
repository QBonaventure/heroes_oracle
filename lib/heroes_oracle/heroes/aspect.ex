defmodule HeroesOracle.Heroes.Aspect do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.Hero
  alias HeroesOracle.Heroes.Aspect


  schema "heroes_aspects" do
    field :aspect_type_id, :id
    # field :hero_id, :id
    field :aspect_value_id, :id
    belongs_to :hero, Hero
  end

  @doc false
  def changeset(%Aspect{} = aspect, attrs) do
    aspect
    |> cast(attrs, [])
    |> validate_required([])
  end
end
