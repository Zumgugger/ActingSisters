# == Schema Information
#
# Table name: entrances
#
#  id          :integer          not null, primary key
#  cast_id     :integer
#  scene_id    :integer
#  role_id     :integer
#  speaking?   :boolean
#  singing?    :boolean
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Entrance < ActiveRecord::Base
  belongs_to :cast
  belongs_to :scene
  belongs_to :role
end
