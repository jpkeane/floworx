require 'csv'

namespace :seed do
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
      Staff.find_or_create_by!(first_name: p['First Name'],
                               last_name: p['Last Name'],
                               email: p['Email'],
                               slug: p['Slug'])
    end
  end
end
