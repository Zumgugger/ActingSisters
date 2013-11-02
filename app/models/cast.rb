# == Schema Information
#
# Table name: casts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Cast < ActiveRecord::Base
  has_many :entrances
  has_many :allocations
end
