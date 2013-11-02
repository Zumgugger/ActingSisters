ActiveAdmin.register Actor do
  controller do
    def permitted_params
      params.permit actor: [:name, :last_name, :schoolclass, :description]
    end
  end
  
  index do 
    selectable_column
    column :name, :sortable => :name
    column :last_name
    column :schoolclass, :sortable => :schoolclass
    default_actions
  end
  
  filter :name
  filter :last_name
  filter :schoolclass

end
