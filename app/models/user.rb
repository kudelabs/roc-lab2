class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
   validates :email, :uniqueness => true
   has_many :messages
   has_many :replies
  
  before_create :set_name
  def self.authenticate(email, password) 
    User.find_by_email_and_password(email, password)
  end
  protected
  def set_name
    self.name ||= email.split("@").first
  end
  
end
