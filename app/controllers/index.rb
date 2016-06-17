 get '/' do

   @logs = Log.all
   @users = User.all
   @user = User.find(session[:user_id]) if session[:user_id]
   erb :index

  end
