ActiveAdmin.register Entrance do
  controller do
    def permitted_params
      params.permit entrance: [:speaking?, :singing?, :description, :cast_id, :scene_id, :role_id]
    end
  end

  
  index do 
    column :cast, :sortable => :cast
    column :scene, :sortable => :scene
    column :role, :sortable => :role
    column :speaking?
    column :singing?
    column :description
    default_actions
    
  end
  
  filter :cast
  filter :role
  filter :scene
  filter :speaking?
  filter :singing?
      

end
