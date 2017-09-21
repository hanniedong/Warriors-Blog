class SessionsController < ApplicationController
  include SessionsHelper 

  def new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email]) 
    if @user && @user.authenticate(params[:sessions][:password])
      login
      redirect_to '/'
    else
      @errors = ['Invalid email/password']
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to '/'
  end

end
