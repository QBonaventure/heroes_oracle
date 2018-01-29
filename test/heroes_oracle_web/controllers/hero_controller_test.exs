defmodule HeroesOracleWeb.HeroControllerTest do
  use HeroesOracleWeb.ConnCase

  alias HeroesOracle.Heroes

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:hero) do
    {:ok, hero} = Heroes.create_hero(@create_attrs)
    hero
  end

  describe "index" do
    test "lists all heroes", %{conn: conn} do
      conn = get conn, hero_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Heroes"
    end
  end

  describe "new hero" do
    test "renders form", %{conn: conn} do
      conn = get conn, hero_path(conn, :new)
      assert html_response(conn, 200) =~ "New Hero"
    end
  end

  describe "create hero" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, hero_path(conn, :create), hero: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == hero_path(conn, :show, id)

      conn = get conn, hero_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Hero"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, hero_path(conn, :create), hero: @invalid_attrs
      assert html_response(conn, 200) =~ "New Hero"
    end
  end

  describe "edit hero" do
    setup [:create_hero]

    test "renders form for editing chosen hero", %{conn: conn, hero: hero} do
      conn = get conn, hero_path(conn, :edit, hero)
      assert html_response(conn, 200) =~ "Edit Hero"
    end
  end

  describe "update hero" do
    setup [:create_hero]

    test "redirects when data is valid", %{conn: conn, hero: hero} do
      conn = put conn, hero_path(conn, :update, hero), hero: @update_attrs
      assert redirected_to(conn) == hero_path(conn, :show, hero)

      conn = get conn, hero_path(conn, :show, hero)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, hero: hero} do
      conn = put conn, hero_path(conn, :update, hero), hero: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Hero"
    end
  end

  describe "delete hero" do
    setup [:create_hero]

    test "deletes chosen hero", %{conn: conn, hero: hero} do
      conn = delete conn, hero_path(conn, :delete, hero)
      assert redirected_to(conn) == hero_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, hero_path(conn, :show, hero)
      end
    end
  end

  defp create_hero(_) do
    hero = fixture(:hero)
    {:ok, hero: hero}
  end
end
