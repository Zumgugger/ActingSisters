class Allocation < ActiveRecord::Base
  belongs_to :role
  belongs_to :actor
  belongs_to :cast
  
  
    def name
    "#{self.cast.name.capitalize} - #{self.role.name} - #{self.actor.name}"
    end
end
