defmodule HeroesOracle.Heroes.Talent do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.Talent


  schema "talents" do
    field :description, :string
    field :level, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Talent{} = talent, attrs) do
    talent
    |> cast(attrs, [:name, :level, :description])
    |> validate_required([:name, :level, :description])
  end
end
