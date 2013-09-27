class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :country
  mount_uploader :photo, EmployeeUploader
  self.per_page = 10

end
