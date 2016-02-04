class OmniauthCallbacksController < ApplicationController
  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user
    redirect_to user_url
  end
end
