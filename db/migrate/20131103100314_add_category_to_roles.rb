class AddCategoryToRoles < ActiveRecord::Migration
  def change
    add_reference :roles, :category, index: true
  end
end
