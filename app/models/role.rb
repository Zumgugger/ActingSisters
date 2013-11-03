# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#

class Role < ActiveRecord::Base
  has_many :entrances
  has_many :scenes, :through => :entrances
  has_many :allocations
  has_many :actors, :through => :allocations
  belongs_to :category
  
  
  def self.import(file)
      require 'roo'
      spreadsheet =  open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |r|
         row = Hash[[header, spreadsheet.row(r)].transpose]

        role = find_by_id(row["id"]) || new
        role.attributes = row.to_hash.slice("id", "name")

        role.save!
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
