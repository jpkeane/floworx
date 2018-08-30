class CreateStaffRoleSuitabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_role_suitabilities do |t|
      t.references :staff, foreign_key: true
      t.references :role, foreign_key: true
      t.integer :suitability

      t.timestamps
    end
  end
end
