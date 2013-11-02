class RemoveCastFromRoles < ActiveRecord::Migration
  def change
    remove_reference :roles, :cast, index: true
  end
end
