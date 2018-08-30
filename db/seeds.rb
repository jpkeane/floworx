# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Engagement.destroy_all
Role.destroy_all
Skill.destroy_all
Grade.destroy_all
Team.destroy_all
StaffRoleSuitability.destroy_all
StaffSkillLevel.destroy_all
Staff.destroy_all
Client.destroy_all
Project.destroy_all

Rake::Task['seed:grades'].invoke
Rake::Task['seed:roles'].invoke
Rake::Task['seed:skills'].invoke
Rake::Task['seed:teams'].invoke
Rake::Task['seed:staff'].invoke
Rake::Task['seed:staff_role_suitability'].invoke
Rake::Task['seed:staff_skill_level'].invoke
Rake::Task['seed:clients'].invoke
Rake::Task['seed:projects'].invoke
Rake::Task['seed:engagements'].invoke