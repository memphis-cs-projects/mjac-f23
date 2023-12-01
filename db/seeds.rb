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
  last_name: 'McMeans',
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

#non-admin test user for create product function
user5 = User.create!(
  email: 'notadmin@mail.com',
  password: 'password',
  first_name: 'not',
  last_name: 'admin',
  street_address: '101 Street',
  zip_code: '11111',
  city: 'City5',
  state: 'State5',
  admin: false
)

#test products for filter on shop page
Product.create!(
  name: 'kibble',
  description: 'cat food',
  category: 'food',
  price: 10.99,
  user: user2
)

Product.create!(
  name: 'mouse',
  description: 'cat toy',
  category: 'toy',
  price: 11.99,
  user: user2
)

Product.create!(
  name: 'purfect food',
  description: 'cat food',
  category: 'food',
  price: 12.99,
  user: user2
)

Product.create!(
  name: 'bird feathers',
  description: 'cat toy',
  category: 'toy',
  price: 13.99,
  user: user2
)