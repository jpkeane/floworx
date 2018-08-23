class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end
