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
alias HeroesOracle.Heroes.{HeroRole, HeroType, RefAspectType, RefAspectValue}
alias HeroesOracle.Common.String

Repo.insert!(%String{string: "very low"})
Repo.insert!(%String{string: "low"})
Repo.insert!(%String{string: "average"})
Repo.insert!(%String{string: "high"})
Repo.insert!(%String{string: "very high"})

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
Repo.insert!(%RefAspectType{name: "burst dmg"})
Repo.insert!(%RefAspectType{name: "dmg AA/spell"})
Repo.insert!(%RefAspectType{name: "sustain heal"})
Repo.insert!(%RefAspectType{name: "burst heal"})
Repo.insert!(%RefAspectType{name: "cc"})
Repo.insert!(%RefAspectType{name: "dive / mobility"})
Repo.insert!(%RefAspectType{name: "globality"})
Repo.insert!(%RefAspectType{name: "duellist"})
Repo.insert!(%RefAspectType{name: "monotarget PvE"})
Repo.insert!(%RefAspectType{name: "camps"})
Repo.insert!(%RefAspectType{name: "sololane"})
Repo.insert!(%RefAspectType{name: "waveclear"})
Repo.insert!(%RefAspectType{name: "double soak"})
Repo.insert!(%RefAspectType{name: "push capacity"})
Repo.insert!(%RefAspectType{name: "cd"})
Repo.insert!(%RefAspectType{name: "mana consumption"})
Repo.insert!(%RefAspectType{name: "base armor"})

# Repo.insert!(%RefAspectValue{name: "very low", aspect_type_id: 1})
# Repo.insert!(%RefAspectValue{name: "low", aspect_type_id: 1})
# Repo.insert!(%RefAspectValue{name: "average", aspect_type_id: 1})
# Repo.insert!(%RefAspectValue{name: "high", aspect_type_id: 1})
# Repo.insert!(%RefAspectValue{name: "very high", aspect_type_id: 1})
# Repo.insert!(%RefAspectValue{name: "very low", aspect_type_id: 2})
# Repo.insert!(%RefAspectValue{name: "low", aspect_type_id: 2})
# Repo.insert!(%RefAspectValue{name: "average", aspect_type_id: 2})
# Repo.insert!(%RefAspectValue{name: "high", aspect_type_id: 2})
# Repo.insert!(%RefAspectValue{name: "very high", aspect_type_id: 2})
