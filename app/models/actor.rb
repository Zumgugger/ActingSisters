# == Schema Information
#
# Table name: actors
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  last_name   :string(255)
#  description :text
#  schoolclass :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Actor < ActiveRecord::Base
  has_many :allocations
  has_many :roles, :through => :allocations
end
