defmodule HeroesOracleWeb.HeroesAspectsControllerTest do
  use HeroesOracleWeb.ConnCase

  alias HeroesOracle.Heroes

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:heroes_aspects) do
    {:ok, heroes_aspects} = Heroes.create_heroes_aspects(@create_attrs)
    heroes_aspects
  end

  describe "index" do
    test "lists all heroes_aspects", %{conn: conn} do
      conn = get conn, heroes_aspects_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Heroes aspects"
    end
  end

  describe "new heroes_aspects" do
    test "renders form", %{conn: conn} do
      conn = get conn, heroes_aspects_path(conn, :new)
      assert html_response(conn, 200) =~ "New Heroes aspects"
    end
  end

  describe "create heroes_aspects" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, heroes_aspects_path(conn, :create), heroes_aspects: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == heroes_aspects_path(conn, :show, id)

      conn = get conn, heroes_aspects_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Heroes aspects"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, heroes_aspects_path(conn, :create), heroes_aspects: @invalid_attrs
      assert html_response(conn, 200) =~ "New Heroes aspects"
    end
  end

  describe "edit heroes_aspects" do
    setup [:create_heroes_aspects]

    test "renders form for editing chosen heroes_aspects", %{conn: conn, heroes_aspects: heroes_aspects} do
      conn = get conn, heroes_aspects_path(conn, :edit, heroes_aspects)
      assert html_response(conn, 200) =~ "Edit Heroes aspects"
    end
  end

  describe "update heroes_aspects" do
    setup [:create_heroes_aspects]

    test "redirects when data is valid", %{conn: conn, heroes_aspects: heroes_aspects} do
      conn = put conn, heroes_aspects_path(conn, :update, heroes_aspects), heroes_aspects: @update_attrs
      assert redirected_to(conn) == heroes_aspects_path(conn, :show, heroes_aspects)

      conn = get conn, heroes_aspects_path(conn, :show, heroes_aspects)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, heroes_aspects: heroes_aspects} do
      conn = put conn, heroes_aspects_path(conn, :update, heroes_aspects), heroes_aspects: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Heroes aspects"
    end
  end

  describe "delete heroes_aspects" do
    setup [:create_heroes_aspects]

    test "deletes chosen heroes_aspects", %{conn: conn, heroes_aspects: heroes_aspects} do
      conn = delete conn, heroes_aspects_path(conn, :delete, heroes_aspects)
      assert redirected_to(conn) == heroes_aspects_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, heroes_aspects_path(conn, :show, heroes_aspects)
      end
    end
  end

  defp create_heroes_aspects(_) do
    heroes_aspects = fixture(:heroes_aspects)
    {:ok, heroes_aspects: heroes_aspects}
  end
end
