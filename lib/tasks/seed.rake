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

  task skills: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'skills.csv')
    skills = CSV.read(csv_path, headers: true)

    skills.each do |p|
      Skill.find_or_create_by!(name: p['Name'],
                               slug: p['Slug'])
    end
  end

  task staff_skill_level: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'staff_skill_level.csv')
    ssl = CSV.read(csv_path, headers: true)

    ssl.each do |p|
      staff = Staff.find_by(slug: p['Staff Slug'])
      skill = Skill.find_by(slug: p['Skill Slug'])
      StaffSkillLevel.find_or_create_by!(staff: staff,
                                         skill: skill,
                                         level: p['Level'])
    end
  end

  task projects: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'projects.csv')
    project = CSV.read(csv_path, headers: true)

    project.each do |p|
      client = Client.find_by(slug: p['Client Slug'])
      Project.find_or_create_by!(client: client,
                                 name: p['Name'],
                                 code: p['Code'],
                                 slug: p['Slug'])
    end
  end

  task engagements: :environment do
    csv_path = Rails.root.join('db', 'seeds', 'engagements.csv')
    engagements = CSV.read(csv_path, headers: true)

    engagements.each do |p|
      project = Project.find_by(slug: p['Project Slug'])
      role = Role.find_by(slug: p['Role Slug'])
      staff = Staff.find_by(slug: p['Staff Slug'])
      Engagement.find_or_create_by!(project: project,
                                    role: role,
                                    staff: staff,
                                    start_date: p['Start Date'],
                                    end_date: p['End Date'])
    end
  end
end
