class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :country
end
