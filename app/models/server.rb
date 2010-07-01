class Server < ActiveRecord::Base
  has_many :accounts
#  has_many :hostings
#  has_many :accounts, :through => :hostings
  def to_s
    self.alias
  end
end
