class Customer < ActiveRecord::Base
  attr_accessor :repassword
  attr_accessible :username, :password, :email, :repassword

  validates :username, :uniqueness => true
  validates_presence_of :username

  validates :password, :length => { :in => 6..20 }
  validates_presence_of :password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  #  before_save :validate
  before_save :before_create

  after_save :after_create

  def self.authenticate(user, password)
    customer =  Customer.find_by_username(user)
    #password == self.hash_password(customer.password)
    if self.hash_password(password) == customer.password
      customer
    else
      nil
    end
  end



  def before_create
    self.password = Package.hash_password(self.password)
  end

  def after_create
    @password = nil
  end

  private
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
