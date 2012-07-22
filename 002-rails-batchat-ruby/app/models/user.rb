class User < ActiveRecord::Base
  attr_accessible :name, :logged_in
  validates :name, :presence => true

  has_many :messages

  def self.check_expiry
    User.where("updated_at < ? AND logged_in = ?", 60.seconds.ago, true).each do |user|
      user.logged_in = false
      user.save!
    end
  end
end
