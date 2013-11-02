class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :number
      t.string :scenery

      t.timestamps
    end
  end
end
