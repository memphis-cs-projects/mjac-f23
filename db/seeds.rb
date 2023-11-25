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
  password: 'password',
  first_name: 'Rizeq',
  last_name: 'Lastname1',
  street_address: '123 Main St',
  zip_code: '12345',
  city: 'City1',
  state: 'State1',
  admin: true
)

user2 = User.create!(
  email: 'matthew@mail.com',
  password: 'password',
  first_name: 'Matthew',
  last_name: 'Lastname2',
  street_address: '456 Oak St',
  zip_code: '67890',
  city: 'City2',
  state: 'State2',
  admin: true
)

user3 = User.create!(
  email: 'jorge@mail.com',
  password: 'password',
  first_name: 'Jorge',
  last_name: 'Lastname3',
  street_address: '789 Pine St',
  zip_code: '23456',
  city: 'City3',
  state: 'State3',
  admin: true
)

user4 = User.create!(
  email: 'cheng@mail.com',
  password: 'password',
  first_name: 'Cheng',
  last_name: 'Lastname4',
  street_address: '101 Elm St',
  zip_code: '78901',
  city: 'City4',
  state: 'State4',
  admin: true
)


item0 = Product.create!(
  name: 'Cat food',
  price: 31.71,
  description: 'Contains 25 essential vitamins and minerals',
  user: user3
)
item1 = Product.create!(
  name: 'Cat toy',
  price: 14.99,
  description: '12-Day Cat Toy Advent Calendar from Merry Makings',
  user: user2
)

