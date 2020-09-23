# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

_list = [
    [ "96999017050",  1 ],
    [ "39539424097",  1 ],
    [ "42606936035",  1 ],
    [ "90669841048",  1 ],
    [ "62364221099",  1 ],
    [ "71368379010",  1 ],
    [ "49232644037",  1 ],
    [ "45944402075",  1 ]
  ]

  _list.each do |cpf, active|
    Blacklist.create( cpf: cpf, active: active)
  end