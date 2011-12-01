class Reply < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  #gices us reply.message
  

end
