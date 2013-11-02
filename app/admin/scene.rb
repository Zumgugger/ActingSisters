ActiveAdmin.register Scene do
controller do
    def permitted_params
      params.permit scene: [:number, :scenery]
    end
  end
  
  index do 
    selectable_column
    column :number
    column :scenery
    default_actions
  end
  
  filter :number
  filter :scenery

end
