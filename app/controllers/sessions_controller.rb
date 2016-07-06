class SessionsController < ApplicationController
  def new
  end

  def create
    if params.key? :code
      member = Member.find_by(code: params[:code])
      if member
        session[:login] = params[:code]
        redirect_to member_path member
      else
        session[:login] = nil
        @msg = 'スタッフコードが間違っています'
        render 'new'
      end
    end
  end

  def logout
    session[:login] = nil
    redirect_to root_url
  end
end
