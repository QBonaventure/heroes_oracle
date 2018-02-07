defmodule HeroesOracle.Common.String do
  use Ecto.Schema
  import Ecto.Changeset
  alias HeroesOracle.Common.String


  schema "strings" do
    field :string, :string
  end

  @doc false
  def changeset(%String{} = string, attrs) do
    string
    |> cast(attrs, [:string])
    |> validate_required([:string])
  end
end
