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

  describe "ref_aspects_types" do
    alias HeroesOracle.Heroes.RefAspectType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def ref_aspect_type_fixture(attrs \\ %{}) do
      {:ok, ref_aspect_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Heroes.create_ref_aspect_type()

      ref_aspect_type
    end

    test "list_ref_aspects_types/0 returns all ref_aspects_types" do
      ref_aspect_type = ref_aspect_type_fixture()
      assert Heroes.list_ref_aspects_types() == [ref_aspect_type]
    end

    test "get_ref_aspect_type!/1 returns the ref_aspect_type with given id" do
      ref_aspect_type = ref_aspect_type_fixture()
      assert Heroes.get_ref_aspect_type!(ref_aspect_type.id) == ref_aspect_type
    end

    test "create_ref_aspect_type/1 with valid data creates a ref_aspect_type" do
      assert {:ok, %RefAspectType{} = ref_aspect_type} = Heroes.create_ref_aspect_type(@valid_attrs)
      assert ref_aspect_type.name == "some name"
    end

    test "create_ref_aspect_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heroes.create_ref_aspect_type(@invalid_attrs)
    end

    test "update_ref_aspect_type/2 with valid data updates the ref_aspect_type" do
      ref_aspect_type = ref_aspect_type_fixture()
      assert {:ok, ref_aspect_type} = Heroes.update_ref_aspect_type(ref_aspect_type, @update_attrs)
      assert %RefAspectType{} = ref_aspect_type
      assert ref_aspect_type.name == "some updated name"
    end

    test "update_ref_aspect_type/2 with invalid data returns error changeset" do
      ref_aspect_type = ref_aspect_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Heroes.update_ref_aspect_type(ref_aspect_type, @invalid_attrs)
      assert ref_aspect_type == Heroes.get_ref_aspect_type!(ref_aspect_type.id)
    end

    test "delete_ref_aspect_type/1 deletes the ref_aspect_type" do
      ref_aspect_type = ref_aspect_type_fixture()
      assert {:ok, %RefAspectType{}} = Heroes.delete_ref_aspect_type(ref_aspect_type)
      assert_raise Ecto.NoResultsError, fn -> Heroes.get_ref_aspect_type!(ref_aspect_type.id) end
    end

    test "change_ref_aspect_type/1 returns a ref_aspect_type changeset" do
      ref_aspect_type = ref_aspect_type_fixture()
      assert %Ecto.Changeset{} = Heroes.change_ref_aspect_type(ref_aspect_type)
    end
  end

  describe "aspects_values" do
    alias HeroesOracle.Heroes.AspectValue

    @valid_attrs %{value: "some value"}
    @update_attrs %{value: "some updated value"}
    @invalid_attrs %{value: nil}

    def aspect_value_fixture(attrs \\ %{}) do
      {:ok, aspect_value} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Heroes.create_aspect_value()

      aspect_value
    end

    test "list_aspects_values/0 returns all aspects_values" do
      aspect_value = aspect_value_fixture()
      assert Heroes.list_aspects_values() == [aspect_value]
    end

    test "get_aspect_value!/1 returns the aspect_value with given id" do
      aspect_value = aspect_value_fixture()
      assert Heroes.get_aspect_value!(aspect_value.id) == aspect_value
    end

    test "create_aspect_value/1 with valid data creates a aspect_value" do
      assert {:ok, %AspectValue{} = aspect_value} = Heroes.create_aspect_value(@valid_attrs)
      assert aspect_value.value == "some value"
    end

    test "create_aspect_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heroes.create_aspect_value(@invalid_attrs)
    end

    test "update_aspect_value/2 with valid data updates the aspect_value" do
      aspect_value = aspect_value_fixture()
      assert {:ok, aspect_value} = Heroes.update_aspect_value(aspect_value, @update_attrs)
      assert %AspectValue{} = aspect_value
      assert aspect_value.value == "some updated value"
    end

    test "update_aspect_value/2 with invalid data returns error changeset" do
      aspect_value = aspect_value_fixture()
      assert {:error, %Ecto.Changeset{}} = Heroes.update_aspect_value(aspect_value, @invalid_attrs)
      assert aspect_value == Heroes.get_aspect_value!(aspect_value.id)
    end

    test "delete_aspect_value/1 deletes the aspect_value" do
      aspect_value = aspect_value_fixture()
      assert {:ok, %AspectValue{}} = Heroes.delete_aspect_value(aspect_value)
      assert_raise Ecto.NoResultsError, fn -> Heroes.get_aspect_value!(aspect_value.id) end
    end

    test "change_aspect_value/1 returns a aspect_value changeset" do
      aspect_value = aspect_value_fixture()
      assert %Ecto.Changeset{} = Heroes.change_aspect_value(aspect_value)
    end
  end

  describe "heroes_aspects" do
    alias HeroesOracle.Heroes.Aspect

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def heroes_aspects_fixture(attrs \\ %{}) do
      {:ok, heroes_aspects} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Heroes.create_heroes_aspects()

      heroes_aspects
    end

    test "list_heroes_aspects/0 returns all heroes_aspects" do
      heroes_aspects = heroes_aspects_fixture()
      assert Heroes.list_heroes_aspects() == [heroes_aspects]
    end

    test "get_heroes_aspects!/1 returns the heroes_aspects with given id" do
      heroes_aspects = heroes_aspects_fixture()
      assert Heroes.get_heroes_aspects!(heroes_aspects.id) == heroes_aspects
    end

    test "create_heroes_aspects/1 with valid data creates a heroes_aspects" do
      assert {:ok, %Aspect{} = heroes_aspects} = Heroes.create_heroes_aspects(@valid_attrs)
    end

    test "create_heroes_aspects/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Heroes.create_heroes_aspects(@invalid_attrs)
    end

    test "update_heroes_aspects/2 with valid data updates the heroes_aspects" do
      heroes_aspects = heroes_aspects_fixture()
      assert {:ok, heroes_aspects} = Heroes.update_heroes_aspects(heroes_aspects, @update_attrs)
      assert %Aspect{} = heroes_aspects
    end

    test "update_heroes_aspects/2 with invalid data returns error changeset" do
      heroes_aspects = heroes_aspects_fixture()
      assert {:error, %Ecto.Changeset{}} = Heroes.update_heroes_aspects(heroes_aspects, @invalid_attrs)
      assert heroes_aspects == Heroes.get_heroes_aspects!(heroes_aspects.id)
    end

    test "delete_heroes_aspects/1 deletes the heroes_aspects" do
      heroes_aspects = heroes_aspects_fixture()
      assert {:ok, %Aspect{}} = Heroes.delete_heroes_aspects(heroes_aspects)
      assert_raise Ecto.NoResultsError, fn -> Heroes.get_heroes_aspects!(heroes_aspects.id) end
    end

    test "change_heroes_aspects/1 returns a heroes_aspects changeset" do
      heroes_aspects = heroes_aspects_fixture()
      assert %Ecto.Changeset{} = Heroes.change_heroes_aspects(heroes_aspects)
    end
  end
end
