class UsersCookie < ActiveRecord::Base
  belongs_to :user
  belongs_to :cookie_type

  def cookie_count
    self.user.users_cookies.where(cookie_type_id: self.cookie_type_id).count
  end
end
