# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create({name: "Earl", age:5, sex: 'M', birth_date:Time.now-1000, color:"red" })
Cat.create({name: "Fred", age:5, sex: 'M', birth_date:Time.now-1000, color:"green" })
Cat.create({name: "Lisa", age:5, sex: 'F', birth_date:Time.now-1000, color:"red" })
Cat.create({name: "Jonathon", age:15, sex: 'M', birth_date:Time.now-1000, color:"blue" })