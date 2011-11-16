class Message < ActiveRecord::Base
  has_many :replies
  # gives us message.replies
  # note the automatic pluralization

end
