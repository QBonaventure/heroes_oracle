defmodule HeroesOracle.Heroes.HeroRole do
  use Ecto.Schema
  import Ecto.Changeset
  # alias HeroesOracle.Heroes.{Hero}


  schema "ref_heroes_roles" do
    field :name, :string
  end
  
end
