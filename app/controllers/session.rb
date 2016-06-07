
 get '/register' do
   erb :register
 end

 post '/register' do

     user = User.new(username: params[:username], image: params[:image])
     user.password = params[:password]
     user.save
     session[:user_id] = user.id
     redirect '/'

 end

 get '/login' do
    if request.xhr?
    erb :'login', layout: false
  else
    erb :'login'
  end
 end

 post '/login' do
   user = User.authenticate(params[:username], params[:password]) if User.find_by(username: params[:username])
   if user
     session[:user_id] = user.id
     redirect '/'
   else
     erb :login
   end
 end

 get '/logout' do
   session.clear
   redirect '/'
 end

post '/users' do
   @user = User.find_by_username(params[:username])
    @logs = Log.all
    if @user.password == params[:password]
      session[:user_id] = @user.id
    else
      redirect '/login'
    end
  if request.xhr?
    welcome = "<p>Welcome, #{@user.username} </p>"
    a_tag = "<li><a href='/'>Home</a></li>
      <li><a href='/logout'>Logout</a></li>
      <li><a href='/groupup'>Group Up</a></li>
      <li><a href='/feed'>My Feed</a></li>
      <li><a href='/'>Newest</a></li>"

    follows = (erb :'_follows', layout: false)






    content_type :json
    { welcome: welcome, a_tag: a_tag, follows: follows }.to_json
  else
    redirect '/'
  end
end
