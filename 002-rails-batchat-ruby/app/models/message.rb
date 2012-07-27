class Message < ActiveRecord::Base
  attr_accessible :content, :user_id
  validates :content, :presence => true

  belongs_to :user
end
