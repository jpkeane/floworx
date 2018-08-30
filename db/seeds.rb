# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.destroy_all
Grade.destroy_all
Team.destroy_all
Staff.destroy_all
Client.destroy_all

Rake::Task['seed:grades'].invoke
Rake::Task['seed:roles'].invoke
Rake::Task['seed:teams'].invoke
Rake::Task['seed:staff'].invoke
Rake::Task['seed:staff_role_suitability'].invoke
Rake::Task['seed:clients'].invoke