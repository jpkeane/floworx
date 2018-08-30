class CreateStaffSkillLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_skill_levels do |t|
      t.references :staff, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
