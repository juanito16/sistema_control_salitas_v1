class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :country
  has_many :reservations
  mount_uploader :photo, EmployeeUploader
  self.per_page = 10	
  validates :name,:lastname,:email,:company_id,:country_id,:photo, presence: true
end
