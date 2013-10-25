class Reservation < ActiveRecord::Base
  belongs_to :parlo
  belongs_to :employee
end
