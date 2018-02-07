defmodule HeroesOracle.CommonTest do
  use HeroesOracle.DataCase

  alias HeroesOracle.Common

  describe "ref" do
    alias HeroesOracle.Common.String

    @valid_attrs %{string: "some string"}
    @update_attrs %{string: "some updated string"}
    @invalid_attrs %{string: nil}

    def string_fixture(attrs \\ %{}) do
      {:ok, string} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Common.create_string()

      string
    end

    test "list_ref/0 returns all ref" do
      string = string_fixture()
      assert Common.list_ref() == [string]
    end

    test "get_string!/1 returns the string with given id" do
      string = string_fixture()
      assert Common.get_string!(string.id) == string
    end

    test "create_string/1 with valid data creates a string" do
      assert {:ok, %String{} = string} = Common.create_string(@valid_attrs)
      assert string.string == "some string"
    end

    test "create_string/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Common.create_string(@invalid_attrs)
    end

    test "update_string/2 with valid data updates the string" do
      string = string_fixture()
      assert {:ok, string} = Common.update_string(string, @update_attrs)
      assert %String{} = string
      assert string.string == "some updated string"
    end

    test "update_string/2 with invalid data returns error changeset" do
      string = string_fixture()
      assert {:error, %Ecto.Changeset{}} = Common.update_string(string, @invalid_attrs)
      assert string == Common.get_string!(string.id)
    end

    test "delete_string/1 deletes the string" do
      string = string_fixture()
      assert {:ok, %String{}} = Common.delete_string(string)
      assert_raise Ecto.NoResultsError, fn -> Common.get_string!(string.id) end
    end

    test "change_string/1 returns a string changeset" do
      string = string_fixture()
      assert %Ecto.Changeset{} = Common.change_string(string)
    end
  end

  describe "strings" do
    alias HeroesOracle.Common.String

    @valid_attrs %{string: "some string"}
    @update_attrs %{string: "some updated string"}
    @invalid_attrs %{string: nil}

    def string_fixture(attrs \\ %{}) do
      {:ok, string} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Common.create_string()

      string
    end

    test "list_strings/0 returns all strings" do
      string = string_fixture()
      assert Common.list_strings() == [string]
    end

    test "get_string!/1 returns the string with given id" do
      string = string_fixture()
      assert Common.get_string!(string.id) == string
    end

    test "create_string/1 with valid data creates a string" do
      assert {:ok, %String{} = string} = Common.create_string(@valid_attrs)
      assert string.string == "some string"
    end

    test "create_string/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Common.create_string(@invalid_attrs)
    end

    test "update_string/2 with valid data updates the string" do
      string = string_fixture()
      assert {:ok, string} = Common.update_string(string, @update_attrs)
      assert %String{} = string
      assert string.string == "some updated string"
    end

    test "update_string/2 with invalid data returns error changeset" do
      string = string_fixture()
      assert {:error, %Ecto.Changeset{}} = Common.update_string(string, @invalid_attrs)
      assert string == Common.get_string!(string.id)
    end

    test "delete_string/1 deletes the string" do
      string = string_fixture()
      assert {:ok, %String{}} = Common.delete_string(string)
      assert_raise Ecto.NoResultsError, fn -> Common.get_string!(string.id) end
    end

    test "change_string/1 returns a string changeset" do
      string = string_fixture()
      assert %Ecto.Changeset{} = Common.change_string(string)
    end
  end
end
