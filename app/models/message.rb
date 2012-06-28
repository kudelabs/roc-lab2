class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body
  has_many :replies
  validates_presence_of :user_id
  
  delegate :name, :email, :to => :user, :allow_nil => true
  validates_length_of :body, :maximum => 140
end
