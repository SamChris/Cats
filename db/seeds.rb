# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: "Jonathan", password: "hello")
Cat.create({name: "Earl", age:5, sex: 'M', birth_date:Date.today-5.years, color:"red", user_id:1})
Cat.create({name: "Fred", age:7, sex: 'M', birth_date:Date.today-7.years, color:"green", user_id:1 })
Cat.create({name: "Lisa", age:3, sex: 'F', birth_date:Date.today-3.years, color:"red", user_id:1})
Cat.create({name: "Tom", age:15, sex: 'M', birth_date:Date.today-15.years, color:"blue", user_id:1 })


CatRentalRequest.create({cat_id: 4, start_date: Date.today - 7.days, end_date: Date.today })
CatRentalRequest.create({cat_id: 4, start_date: Date.today - 5.days, end_date: Date.today+ 7.days })

CatRentalRequest.create({cat_id: 4, start_date: Date.today - 3.days, end_date: Date.today + 1.days})

CatRentalRequest.create({cat_id: 2, start_date: Date.today-7.days, end_date: Date.today - 1.days })
