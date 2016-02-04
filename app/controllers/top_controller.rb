class TopController < ApplicationController
  def index
  end

  def show
    @name = params[:id]
    @user = User.find_by(screen_name: @name)
    return redirect_to @user.url if @user && @user.url
    render status: :not_found
  end
end
