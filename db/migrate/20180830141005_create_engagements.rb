class CreateEngagements < ActiveRecord::Migration[5.2]
  def change
    create_table :engagements do |t|
      t.references :project, foreign_key: true
      t.references :role, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
