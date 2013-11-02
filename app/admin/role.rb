ActiveAdmin.register Role do
   controller do
    def permitted_params
      params.permit role: [:name]
    end
  end
  
  index do 
    selectable_column
    column :name
    default_actions
  end
  
  filter :name

    
    
    
  show do
    panel "Name" do
      role.name
      end

    panel "Szenen" do
      entrances = Entrance.where(:role_id => role.id)
      numbers = []
      entrances.each do |e|
        numbers << e.scene.number
        end
      
      numbers
      end
      
      panel "Sprechszenen" do
      entrances = Entrance.where(:role_id => role.id, :speaking? => true)
      numbers = []
      entrances.each do |e|
        numbers << e.scene.number
        end
      
      numbers
      end
    end
end
