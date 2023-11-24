# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(
  email: 'rizeq@mail.com',
  password: 'password'
)
user2 = User.create!(
  email: 'matthew@mail.com',
  password: 'password'
)
user3 = User.create!(
  email: 'jorge@mail.com',
  password: 'password'
)
user4 = User.create!(
  email: 'cheng@mail.com',
  password: 'password'
)

Product.create!(
  name: 'Cat food',
  price: 31.71,
  description: 'Contains 25 essential vitamins and minerals'
)
Product.create!(
  name: 'Cat toy',
  price: 14.99,
  description: '12-Day Cat Toy Advent Calendar from Merry Makings'
)

