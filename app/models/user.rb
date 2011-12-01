class User < ActiveRecord::Base
  has_many :messages
  has_many :replies
  validates_presence_of :name, :password
  validates_confirmation_of :password
   
  def self.authenticate(name, password)
    User.find_by_name_and_password(name, password)
  end
  def to_s
    name
  end
  
end
