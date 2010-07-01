class Account < ActiveRecord::Base
#  has_many :hostings
#  has_many :servers, :through => :hostings
  belongs_to :server
end
