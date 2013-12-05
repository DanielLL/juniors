class UserCookiesController < ApplicationController
  expose(:user)
  expose(:user_cookies){ user.users_cookies(:group => "cookie_type_id") }
  expose(:cookie_type) { CookieType.find(params[:cookie_type_id])}

  def create
    UsersCookie.create user: user, cookie_type: cookie_type
    redirect_to "/users/#{ user.id }/cookies"
  end
end
