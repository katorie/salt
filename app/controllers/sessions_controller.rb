class SessionsController < ApplicationController
  def new
  end

  def create
    if params.key? :name
      member = Member.find_by(name: params[:name])
      if member
        session[:login] = params[:name]
        redirect_to member_path member
      else
        session[:login] = nil
        @msg = '名前が間違っています'
        render 'new'
      end
    end
  end

  def logout
    session[:login] = nil
    redirect_to root_url
  end
end
