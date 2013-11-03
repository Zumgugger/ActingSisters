class RemoveCastIdFromEntrances < ActiveRecord::Migration


  def up
    remove_column :entrances, :cast_id
  end

  def down
    add_column :entrances, :cast_id, :references
  end
  
end