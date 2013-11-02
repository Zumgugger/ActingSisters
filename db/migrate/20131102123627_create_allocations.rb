class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.references :role, index: true
      t.references :actor, index: true
      t.references :cast, index: true

      t.timestamps
    end
  end
end
