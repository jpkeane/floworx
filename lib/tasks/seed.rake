require 'csv'

namespace :seed do
  task roles: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'roles.csv')
    roles = CSV.read(csv_path, headers: true)

    roles.each do |p|
      Role.find_or_create_by!(name: p['Name'],
                              slug: p['Slug'])
    end
  end

  task grades: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'grades.csv')
    grades = CSV.read(csv_path, headers: true)

    grades.each do |p|
      Grade.find_or_create_by!(name: p['Name'],
                               slug: p['Slug'])
    end
  end

  task teams: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'teams.csv')
    teams = CSV.read(csv_path, headers: true)

    teams.each do |p|
      Team.find_or_create_by!(name: p['Name'],
                              slug: p['Slug'],
                              code: p['Code'])
    end
  end

  task staff: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'staff.csv')
    staff = CSV.read(csv_path, headers: true)

    staff.each do |p|
      grade = Grade.find_by(slug: p['Grade Slug'])
      team = Team.find_by(slug: p['Team Slug'])
      Staff.find_or_create_by!(first_name: p['First Name'],
                               last_name: p['Last Name'],
                               email: p['Email'],
                               slug: p['Slug'],
                               team: team,
                               grade: grade)
    end
  end

  task clients: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'clients.csv')
    clients = CSV.read(csv_path, headers: true)

    clients.each do |p|
      Client.find_or_create_by!(name: p['Name'],
                                slug: p['Slug'],
                                code: p['Code'])
    end
  end

  task staff_role_suitability: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'staff_role_suitability.csv')
    srs = CSV.read(csv_path, headers: true)

    srs.each do |p|
      staff = Staff.find_by(slug: p['Staff Slug'])
      role = Role.find_by(slug: p['Role Slug'])
      StaffRoleSuitability.find_or_create_by!(staff: staff,
                                              role: role,
                                              suitability: p['Suitability'])
    end
  end
end
