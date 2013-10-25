class Parlo < ActiveRecord::Base
  belongs_to :country
  has_many :reservations
end
