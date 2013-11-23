class Order < ActiveRecord::Base
  attr_accessible :customerId, :productId, :domainId, :sitename

  validates :sitename, :uniqueness => true
  validates_presence_of :sitename
end
