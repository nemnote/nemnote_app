class SessionsController < ApplicationController
  def new
    if logged_in?
    redirect_to controller: :notes, action: :show
    end
    @categories = Category.all
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    @categories = Category.all
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to controller: :users, action: :show
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています。'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
    
end
