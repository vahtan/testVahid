class Domain < ActiveRecord::Base

  attr_accessible :dname, :price

  validates :dname, :uniqueness => true
  validates_presence_of :dname

  validates_presence_of :price

end
