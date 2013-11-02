class Actor < ActiveRecord::Base
  has_many :allocations
  has_many :roles, :through => :allocations
end
