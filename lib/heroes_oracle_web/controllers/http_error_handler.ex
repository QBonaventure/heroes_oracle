defmodule HeroesOracleWeb.HttpErrorHandler do
  use HeroesOracleWeb, :controller

  def auth_error(conn, {typ, reason}, _opts) do
    conn
    |> put_flash(:info, "You must be signed in to access this page")
    |> redirect(to: session_path(conn, :new))
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:info, "You must be signed in to access this page")
    |> redirect(to: session_path(conn, :new))
  end

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "You must be signed in to access this page")
    |> redirect(to: session_path(conn, :new))
  end
end
