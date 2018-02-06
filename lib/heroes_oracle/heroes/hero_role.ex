defmodule HeroesOracle.Heroes.HeroRole do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ref_heroes_roles" do
    field :name, :string
  end

end
