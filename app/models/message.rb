class Message < ActiveRecord::Base
  has_many :replies
  belongs_to :user
  # gives us message.replies
  # note the automatic pluralization

end
