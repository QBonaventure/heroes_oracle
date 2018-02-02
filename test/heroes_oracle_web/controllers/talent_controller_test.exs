defmodule HeroesOracleWeb.TalentControllerTest do
  use HeroesOracleWeb.ConnCase

  alias HeroesOracle.Heroes

  @create_attrs %{description: "some description", level: 42, name: "some name"}
  @update_attrs %{description: "some updated description", level: 43, name: "some updated name"}
  @invalid_attrs %{description: nil, level: nil, name: nil}

  def fixture(:talent) do
    {:ok, talent} = Heroes.create_talent(@create_attrs)
    talent
  end

  describe "index" do
    test "lists all talents", %{conn: conn} do
      conn = get conn, talent_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Talents"
    end
  end

  describe "new talent" do
    test "renders form", %{conn: conn} do
      conn = get conn, talent_path(conn, :new)
      assert html_response(conn, 200) =~ "New Talent"
    end
  end

  describe "create talent" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, talent_path(conn, :create), talent: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == talent_path(conn, :show, id)

      conn = get conn, talent_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Talent"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, talent_path(conn, :create), talent: @invalid_attrs
      assert html_response(conn, 200) =~ "New Talent"
    end
  end

  describe "edit talent" do
    setup [:create_talent]

    test "renders form for editing chosen talent", %{conn: conn, talent: talent} do
      conn = get conn, talent_path(conn, :edit, talent)
      assert html_response(conn, 200) =~ "Edit Talent"
    end
  end

  describe "update talent" do
    setup [:create_talent]

    test "redirects when data is valid", %{conn: conn, talent: talent} do
      conn = put conn, talent_path(conn, :update, talent), talent: @update_attrs
      assert redirected_to(conn) == talent_path(conn, :show, talent)

      conn = get conn, talent_path(conn, :show, talent)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, talent: talent} do
      conn = put conn, talent_path(conn, :update, talent), talent: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Talent"
    end
  end

  describe "delete talent" do
    setup [:create_talent]

    test "deletes chosen talent", %{conn: conn, talent: talent} do
      conn = delete conn, talent_path(conn, :delete, talent)
      assert redirected_to(conn) == talent_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, talent_path(conn, :show, talent)
      end
    end
  end

  defp create_talent(_) do
    talent = fixture(:talent)
    {:ok, talent: talent}
  end
end
