# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(user_name: 'kitty_one', password: 'password')
user2 = User.create!(user_name: 'kitty_two', password: 'password2')

Cat.create!(birth_date: '2015/01/20', color: "white", name: "Kitty", sex: "M", description: "I'm Kitty!", user_id: user1.id)
Cat.create!(birth_date: '2011/05/21', color: "black", name: "Fluflu", sex: "F", description: "I'm Fluflu!", user_id: user2.id)
Cat.create!(birth_date: '2000/11/01', color: "orange", name: "Tiger", sex: "M", description: "I'm a Tiger GRWWW!", user_id: user1.id)

