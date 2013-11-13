# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :text
#

class Note < ActiveRecord::Base
end
