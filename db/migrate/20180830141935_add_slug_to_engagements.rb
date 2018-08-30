class AddSlugToEngagements < ActiveRecord::Migration[5.2]
  def change
    add_column :engagements, :slug, :string
  end
end
