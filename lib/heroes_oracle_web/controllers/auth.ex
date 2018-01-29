defmodule HeroesOracle.Auth do
  import Comeonin.Bcrypt
  import Plug.Conn

  alias HeroesOracle.User
  alias HeroesOracle.Repo

  def login(conn, user) do
    conn
    |> HeroesOracle.Guardian.Plug.sign_in(user)
  end

  def login_by_email_and_pass(conn, email, given_pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(User, email: email)

    cond do
      user && checkpw(given_pass, user.password_hash) ->
        {:ok, login(conn, %User{email: user.email, id: user.id})}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end
end
