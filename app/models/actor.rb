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
  
  
  
 validates :id, :uniqueness => true
  
    def self.import(file)
      require 'roo'
      spreadsheet =  open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |r|
         row = Hash[[header, spreadsheet.row(r)].transpose]

        actor = find_by_id(row["id"]) || new
        actor.attributes = row.to_hash.slice("name", "last_name", "description", "schoolclass")

        actor.save!
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
