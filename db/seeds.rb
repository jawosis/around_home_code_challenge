# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ name: 'flooring' }, { name: 'roofing' }])
materials = Material.create([{ name: 'wood' }, { name: 'carpet' }, { name: 'tiles' }])
products = Product.create([
    { category: categories.first, material: materials.first },
    { category: categories.first, material: materials.second },
    { category: categories.first, material: materials.third },
    { category: categories.second, material: materials.first },
    { category: categories.second, material: materials.second },
    { category: categories.second, material: materials.third }
  ])
customers = Customer.create([{ name: 'me', phone: '+49157022113345' }])
partners = Partner.create([
    { name: 'Wood Flooring Nbg', email: 'info@corp.de', phone: '+49911234567', operating_radius_in_km: 30, avg_rating: 3.50, products: [products.first], street: 'Tucherstraße 5', city: 'Nürnberg', country: 'Deutschland' },
    { name: 'Flooring Nbg', email: 'info@corp.de', phone: '+49911234567', operating_radius_in_km: 10, avg_rating: 1.50, products: [products.first, products.second], street: 'Marienstraße 7', city: 'Erlangen', country: 'Deutschland' },
    { name: 'Flooring Nbg 2', email: 'info@corp.de', phone: '+49911234567', operating_radius_in_km: 30, avg_rating: 4.60, products: [products.first, products.second, products.third], street: 'Tucherstraße 5', city: 'Nürnberg', country: 'Deutschland' },
    { name: 'Wood Flooring Mue', email: 'info@corp.de', phone: '+491571234567', operating_radius_in_km: 100, avg_rating: 5.00, products: [products.first], street: 'Medienallee 7', city: 'Unterföhring', country: 'Deutschland' },
    { name: 'Flooring Mue', email: 'info@corp.de', phone: '+491571234567', operating_radius_in_km: 250, avg_rating: 4.60, products: [products.first, products.second, products.third], street: 'Medienallee 7', city: 'Unterföhring', country: 'Deutschland' }
  ])
projects = Project.create([
    { customer: customers.last, partner: partners.first, product: products.first, size_in_qm: 12.5, street: 'Hauptstraße 5', city: 'Bamberg', country: 'Deutschland' },
    { customer: customers.last, partner: partners.second, product: products.first, size_in_qm: 12.5, street: 'Hauptstraße 5', city: 'Bamberg', country: 'Deutschland' },
    { customer: customers.last, partner: partners.third, product: products.first, size_in_qm: 12.5, street: 'Hauptstraße 5', city: 'Bamberg', country: 'Deutschland' },
    { customer: customers.last, partner: partners.fourth, product: products.first, size_in_qm: 12.5, street: 'Hauptstraße 5', city: 'Bamberg', country: 'Deutschland' },
    { customer: customers.last, partner: partners.last, product: products.first, size_in_qm: 12.5, street: 'Hauptstraße 5', city: 'Forchheim', country: 'Deutschland' },
    { customer: customers.first, product: products.first, size_in_qm: 12.5, street: 'Hauptstraße 5', city: 'Erlangen', country: 'Deutschland' }
  ])
