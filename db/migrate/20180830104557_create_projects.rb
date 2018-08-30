class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.references :client
      t.string :code, null: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end
