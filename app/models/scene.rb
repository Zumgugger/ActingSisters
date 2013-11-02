# == Schema Information
#
# Table name: scenes
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  scenery    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Scene < ActiveRecord::Base
  has_many :entrances
  
    def name
    self.number
    end
end
