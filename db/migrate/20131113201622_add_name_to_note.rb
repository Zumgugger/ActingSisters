class AddNameToNote < ActiveRecord::Migration
  def change
    add_column :notes, :name, :text
  end
end
