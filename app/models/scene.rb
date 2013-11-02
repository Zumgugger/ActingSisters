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
  has_many :roles, :through => :entrances
  has_many :casts, :through => :entrances
  
    def name
    self.number
    end
    
    def self.import(file)
      require 'roo'
      spreadsheet =  open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |r|
         row = Hash[[header, spreadsheet.row(r)].transpose]

        scene = find_by_id(row["id"]) || new
        scene.attributes = row.to_hash.slice("id", "number", "scenery")

        scene.save!
      end
    end
    
    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
end
