defmodule HeroesOracleWeb.AspectController do
  use HeroesOracleWeb, :controller
  alias HeroesOracle.Aspect
  alias HeroesOracle.Heroes

  def index(conn, %{"id" => id}) do
    hero = Heroes.get_hero!(id)
    render(conn, "index.html", hero: hero)
  end

end
