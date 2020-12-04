class User < ApplicationRecord
  def self.user_save(user_id)
    User.find_or_create_by(user_id: user_id)
  end
end
