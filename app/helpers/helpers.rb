helpers do
  def login
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:id] = @user.id
    else
      redirect '/login'
    end
  end

  def register
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      login
    else
      redirect '/register'
    end
  end

  def logout
    session.clear
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end
end
