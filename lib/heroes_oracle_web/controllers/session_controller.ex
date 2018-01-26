defmodule HeroesOracleWeb.SessionController do
  use HeroesOracleWeb, :controller
  alias HeroesOracle.Repo

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email,
                                  "password" => pass}}) do
    case HeroesOracle.Auth.login_by_email_and_pass(conn, email, pass,
                                           repo: HeroesOracle.Repo) do
      {:ok, conn} ->
        logged_in_user = HeroesOracle.Guardian.Plug.current_resource(conn)
        conn
        |> put_flash(:info, "Innlogget")
        |> redirect(to: user_path(conn, :show, logged_in_user))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Wrong username/password")
        |> render("new.html")
     end
  end

def delete(conn, _) do
  conn
  |> Guardian.Plug.sign_out
  |> redirect(to: "/")
end
end
