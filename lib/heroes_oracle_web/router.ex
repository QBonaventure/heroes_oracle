defmodule HeroesOracleWeb.Router do
  use HeroesOracleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.Pipeline, module: HeroesOracle.Guardian,
                             error_handler: HeroesOracleWeb.HttpErrorHandler
    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  end

  pipeline :browser_auth do
    plug Guardian.Plug.EnsureAuthenticated
  #   plug Guardian.Plug.EnsureAuthenticated, %{"typ" => "access", handler: HeroesOracleWeb.HttpErrorHandler}
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HeroesOracleWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/heroes", HeroController
    resources "/sessions", SessionController, only: [:new, :create]
    get "/sessions", SessionController, :delete
  end

  scope "/", HeroesOracleWeb do
    pipe_through [:browser, :browser_auth]

    resources "/heroes/:id/aspects", AspectController
    resources "/users", UserController, only: [:show, :update, :index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HeroesOracleWeb do
  #   pipe_through :api
  # end
end
