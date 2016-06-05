get '/feed' do
@current_user = User.find(session[:user_id]) if session[:user_id]
erb :'feed'
end
