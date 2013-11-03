# == Schema Information
#
# Table name: allocations
#
#  id         :integer          not null, primary key
#  role_id    :integer
#  actor_id   :integer
#  cast_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Allocation < ActiveRecord::Base
  belongs_to :role
  belongs_to :actor
  belongs_to :cast
  
  
    def name
    "#{self.cast.name.capitalize} - #{self.role.name} - #{self.actor.name}"
    end
end
