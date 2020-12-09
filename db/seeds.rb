
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




_actor1 = Actor.create(name: "芳根京子")
_actor2 = Actor.create(name: "泉澤祐希")
_actor3 = Actor.create(name: "桜田通")

_content1 = Content.create(name: "私、定時で帰ります")
_content2 = Content.create(name: "先輩と彼女")
_content3 = Content.create(name: "表参道高校合唱部")


_actor1.contents << _content2
_actor1.contents << _content3
_actor1.save

_actor2.contents << _content1
_actor2.contents << _content3
_actor2.save

_actor3.contents << _content1
_actor3.save