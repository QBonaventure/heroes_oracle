defmodule HeroesOracle.Heroes.RefAspectType do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.RefAspectType


  schema "ref_aspects_types" do
    field :name, :string
  end

  @doc false
  def changeset(%RefAspectType{} = ref_aspect_type, attrs) do
    ref_aspect_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
