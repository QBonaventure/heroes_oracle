defmodule HeroesOracle.Heroes.RefAspectValue do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.RefAspectValue


  schema "ref_aspects_values" do
    field :value_string_id, :string
    field :aspect_type_id, :id
  end

  @doc false
  def changeset(%RefAspectValue{} = aspect_value, attrs) do
    aspect_value
    |> cast(attrs, [:value_string_id])
    |> validate_required([:value_string_id])
  end
end
