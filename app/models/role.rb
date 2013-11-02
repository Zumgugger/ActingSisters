# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :entrances
  has_many :scenes, :through => :entrances
  has_many :casts, :through => :entrances
  has_many :allocations
  has_many :actors, :through => :allocations
  
end
