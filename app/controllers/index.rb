 get '/' do
    # Look in app/views/index.erb
   @logs = Log.all
   @users = User.all
   @user = User.find(session[:user_id]) if session[:user_id]
    erb :index

  end
