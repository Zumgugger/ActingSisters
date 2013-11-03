ActiveAdmin.register Entrance do
  controller do
    def permitted_params
      params.permit entrance: [:speaking?, :singing?, :description, :scene_id, :role_id]
    end
  end

  
  index do 
    selectable_column
    column :scene, :sortable => :scene
    column :role, :sortable => :role
    column :speaking?
    column :singing?
    column :description
    default_actions
    
  end
  
  filter :role
  filter :scene
  filter :speaking?
  filter :singing?
      

end
