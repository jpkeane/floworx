class AddTeamIdToStaff < ActiveRecord::Migration[5.2]
  def change
    add_reference :staffs, :team, foreign_key: true
  end
end
