ActiveAdmin.register Cast do
  controller do
    def permitted_params
      params.permit cast: [:name]
    end
  end
  
  index do 
    column :name
    default_actions
  end
  
end
