class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :country
  has_many :reservations, :dependent => :delete_all
  mount_uploader :photo, EmployeeUploader
  validates :name,:lastname,:email,:company_id,:country_id,:photo, presence: true
end
