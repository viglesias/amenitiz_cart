# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product1 = Product.where(code: 'GR1').first
Product.create(code: 'GR1', name: "Green Tea", price: 3.11) if product1.blank?
product2 = Product.where(code: 'SR1').first
Product.create(code: 'SR1', name: "Strawberries", price: 5.00) if product2.blank?
product3 = Product.where(code: 'CF1').first
Product.create(code: 'CF1', name: "Coffe", price: 11.23) if product3.blank?