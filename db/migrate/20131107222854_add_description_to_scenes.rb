class AddDescriptionToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :description, :text
    add_column :scenes, :summary, :text
    add_column :scenes, :text, :text
    add_column :scenes, :mood, :text
  end
end
