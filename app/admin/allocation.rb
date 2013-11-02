ActiveAdmin.register Allocation do
  controller do 
    def permitted_params
      params.permit allocation: [:actor_id, :cast_id, :role_id]
    end
  end
  

    index do 
    selectable_column
    column :cast, :sortable => :cast
    column :role, :sortable => :role
    column :actor, :sortable => :actor
    default_actions
    end
  
  filter :cast
  filter :role
  filter :actor
end
