class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  validates :content, :presence => true

  belongs_to :user
end
