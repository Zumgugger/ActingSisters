class RemoveCategoryFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :category, :string
  end
end
