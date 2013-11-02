class CreateEntrances < ActiveRecord::Migration
  def change
    create_table :entrances do |t|
      t.references :cast, index: true
      t.references :scene, index: true
      t.references :role, index: true
      t.boolean :speaking?
      t.boolean :singing?
      t.text :description

      t.timestamps
    end
  end
end
