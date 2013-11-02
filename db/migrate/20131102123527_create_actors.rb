class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :last_name
      t.text :description
      t.string :schoolclass

      t.timestamps
    end
  end
end
