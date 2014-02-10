class Parlo < ActiveRecord::Base
  belongs_to :country
  has_many :reservations,:dependent => :delete_all
end
