
 get '/register' do
   erb :register
 end

 post '/register' do

     user = User.new(username: params[:username])
     user.password = params[:password]
     user.save
     session[:user_id] = user.id
     redirect '/'

 end

 get '/login' do
   erb :login
 end

 post '/login' do
   user = User.authenticate(params[:username], params[:password])
   if user
     session[:user_id] = user.id
     redirect '/'
   else
     erb :login
   end
 end

 get '/logout' do
   session.delete(:user_id)
   redirect '/'
 end


