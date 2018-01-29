defmodule HeroesOracle.Heroes.Aspect do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Heroes.Aspect


  schema "aspects" do

    timestamps()
  end

  @doc false
  def changeset(%Aspect{} = aspect, attrs) do
    aspect
    |> cast(attrs, [])
    |> validate_required([])
  end
end
