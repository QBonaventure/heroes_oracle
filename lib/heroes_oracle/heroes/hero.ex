defmodule HeroesOracle.Heroes.Hero do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.{Hero, Talent, Aspect, HeroType, HeroRole}


  schema "heroes" do
    field :name, :string

    belongs_to :role, HeroRole, foreign_key: :role_id
    belongs_to :type, HeroType, foreign_key: :type_id

    timestamps()
  end

  def changeset(%Hero{} = hero, attrs) do
    hero
    |> cast(attrs, [:name, :role_id, :type_id])
    |> validate_required([:name, :role_id, :type_id])
  end
end
