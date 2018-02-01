defmodule HeroesOracle.Heroes.Aspect do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.{Aspect, Hero}


  schema "aspects" do
    field :hero_role, :integer
    field :hero_type, :integer
    field :sustain_dmg, :integer
    belongs_to :hero, Hero

    timestamps()
  end

  @doc false
  def changeset(%Aspect{} = aspect, attrs) do
    aspect
    |> cast(attrs, [])
    |> validate_required([])
  end
end
