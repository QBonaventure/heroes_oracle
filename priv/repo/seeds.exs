# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Repo.insert!(%HeroesOracle.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias HeroesOracle.Repo
alias HeroesOracle.Heroes.{HeroRole, HeroType, RefAspectType}

Repo.insert!(%HeroRole{name: "warrior"})
Repo.insert!(%HeroRole{name: "assassin"})
Repo.insert!(%HeroRole{name: "support"})
Repo.insert!(%HeroRole{name: "specialist"})
Repo.insert!(%HeroRole{name: "multiclass"})

Repo.insert!(%HeroType{name: "tank"})
Repo.insert!(%HeroType{name: "bruiser"})
Repo.insert!(%HeroType{name: "healer"})
Repo.insert!(%HeroType{name: "support"})
Repo.insert!(%HeroType{name: "ambusher"})
Repo.insert!(%HeroType{name: "burst damage"})
Repo.insert!(%HeroType{name: "sustained damage"})
Repo.insert!(%HeroType{name: "siege"})
Repo.insert!(%HeroType{name: "utility"})

Repo.insert!(%RefAspectType{name: "sustain dmg"})
