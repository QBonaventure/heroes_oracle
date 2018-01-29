defmodule HeroesOracle.HeroesTest do
  use HeroesOracle.DataCase

  alias HeroesOracle.Heroes

  describe "heroes" do
    alias HeroesOracle.Heroes.Hero

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def hero_fixture(attrs \\ %{}) do
      {:ok, hero} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Heroes.create_hero()

      hero
    end

    test "list_heroes/0 returns all heroes" do
      hero = hero_fixture()
      assert Heroes.list_heroes() == [hero]
    end

    test "get_hero!/1 returns the hero with given id" do
      hero = hero_fixture()
      assert Heroes.get_hero!(hero.id) == hero
    end

    test "create_hero/1 with valid data creates a hero" do
      assert {:ok, %Hero{} = hero} = Heroes.create_hero(@valid_attrs)
      assert hero.name == "some name"
    end

    test "create_hero/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heroes.create_hero(@invalid_attrs)
    end

    test "update_hero/2 with valid data updates the hero" do
      hero = hero_fixture()
      assert {:ok, hero} = Heroes.update_hero(hero, @update_attrs)
      assert %Hero{} = hero
      assert hero.name == "some updated name"
    end

    test "update_hero/2 with invalid data returns error changeset" do
      hero = hero_fixture()
      assert {:error, %Ecto.Changeset{}} = Heroes.update_hero(hero, @invalid_attrs)
      assert hero == Heroes.get_hero!(hero.id)
    end

    test "delete_hero/1 deletes the hero" do
      hero = hero_fixture()
      assert {:ok, %Hero{}} = Heroes.delete_hero(hero)
      assert_raise Ecto.NoResultsError, fn -> Heroes.get_hero!(hero.id) end
    end

    test "change_hero/1 returns a hero changeset" do
      hero = hero_fixture()
      assert %Ecto.Changeset{} = Heroes.change_hero(hero)
    end
  end

  describe "talents" do
    alias HeroesOracle.Heroes.Talent

    @valid_attrs %{description: "some description", level: 42, name: "some name"}
    @update_attrs %{description: "some updated description", level: 43, name: "some updated name"}
    @invalid_attrs %{description: nil, level: nil, name: nil}

    def talent_fixture(attrs \\ %{}) do
      {:ok, talent} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Heroes.create_talent()

      talent
    end

    test "list_talents/0 returns all talents" do
      talent = talent_fixture()
      assert Heroes.list_talents() == [talent]
    end

    test "get_talent!/1 returns the talent with given id" do
      talent = talent_fixture()
      assert Heroes.get_talent!(talent.id) == talent
    end

    test "create_talent/1 with valid data creates a talent" do
      assert {:ok, %Talent{} = talent} = Heroes.create_talent(@valid_attrs)
      assert talent.description == "some description"
      assert talent.level == 42
      assert talent.name == "some name"
    end

    test "create_talent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heroes.create_talent(@invalid_attrs)
    end

    test "update_talent/2 with valid data updates the talent" do
      talent = talent_fixture()
      assert {:ok, talent} = Heroes.update_talent(talent, @update_attrs)
      assert %Talent{} = talent
      assert talent.description == "some updated description"
      assert talent.level == 43
      assert talent.name == "some updated name"
    end

    test "update_talent/2 with invalid data returns error changeset" do
      talent = talent_fixture()
      assert {:error, %Ecto.Changeset{}} = Heroes.update_talent(talent, @invalid_attrs)
      assert talent == Heroes.get_talent!(talent.id)
    end

    test "delete_talent/1 deletes the talent" do
      talent = talent_fixture()
      assert {:ok, %Talent{}} = Heroes.delete_talent(talent)
      assert_raise Ecto.NoResultsError, fn -> Heroes.get_talent!(talent.id) end
    end

    test "change_talent/1 returns a talent changeset" do
      talent = talent_fixture()
      assert %Ecto.Changeset{} = Heroes.change_talent(talent)
    end
  end

  describe "aspects" do
    alias HeroesOracle.Heroes.Aspect

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def aspect_fixture(attrs \\ %{}) do
      {:ok, aspect} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Heroes.create_aspect()

      aspect
    end

    test "list_aspects/0 returns all aspects" do
      aspect = aspect_fixture()
      assert Heroes.list_aspects() == [aspect]
    end

    test "get_aspect!/1 returns the aspect with given id" do
      aspect = aspect_fixture()
      assert Heroes.get_aspect!(aspect.id) == aspect
    end

    test "create_aspect/1 with valid data creates a aspect" do
      assert {:ok, %Aspect{} = aspect} = Heroes.create_aspect(@valid_attrs)
    end

    test "create_aspect/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heroes.create_aspect(@invalid_attrs)
    end

    test "update_aspect/2 with valid data updates the aspect" do
      aspect = aspect_fixture()
      assert {:ok, aspect} = Heroes.update_aspect(aspect, @update_attrs)
      assert %Aspect{} = aspect
    end

    test "update_aspect/2 with invalid data returns error changeset" do
      aspect = aspect_fixture()
      assert {:error, %Ecto.Changeset{}} = Heroes.update_aspect(aspect, @invalid_attrs)
      assert aspect == Heroes.get_aspect!(aspect.id)
    end

    test "delete_aspect/1 deletes the aspect" do
      aspect = aspect_fixture()
      assert {:ok, %Aspect{}} = Heroes.delete_aspect(aspect)
      assert_raise Ecto.NoResultsError, fn -> Heroes.get_aspect!(aspect.id) end
    end

    test "change_aspect/1 returns a aspect changeset" do
      aspect = aspect_fixture()
      assert %Ecto.Changeset{} = Heroes.change_aspect(aspect)
    end
  end
end
