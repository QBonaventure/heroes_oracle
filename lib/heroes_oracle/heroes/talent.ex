defmodule HeroesOracle.Heroes.Talent do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.Talent


  schema "talents" do
    field :description, :string
    field :level, :integer
    field :name, :string
    field :hero_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Talent{} = talent, attrs) do
    talent
    |> cast(attrs, [:hero_id, :level, :name, :description])
    |> validate_required([:hero_id, :level, :name, :description])
  end
end
