get '/logs/new' do
   erb :_log_form, :layout => false
end

get '/logs/:id' do
  @log = Log.find(params[:id])
  erb :'logs/show'
end

post '/logs/:id/like' do
  id = params[:id].to_i
  log = Log.find(params[:id])
  #if log.likes
  log.likes.create(value: 1)
  if request.xhr?
    content_type :json
    {log_id: id, likes: log.points}.to_json
  else
    redirect "/"
  end
end

post '/logs/:id/follow' do
  current_user = User.find(session[:user_id]) if session[:user_id]
  log_of_user = Log.find(params[:id])
  user_to_follow = log_of_user.user
  if !user_to_follow.followers.include?(current_user)
  current_user.followees << user_to_follow
  current_user.save
  redirect "/"
  else
  redirect "/"
end
end

post '/logs/:id/unfollow' do
  current_user = User.find(session[:user_id]) if session[:user_id]
  log_of_user = Log.find(params[:id])
  user_to_follow = log_of_user.user
  current_user.followees.delete(user_to_follow)
  current_user.save
  redirect "/"

end


post '/logs' do
  p "stars" * 300

  Log.create( user_id: current_user.id, title: params[:title], duration: params[:duration], mood: params[:mood], location: params[:location])
  if request.xhr?
     p "blah"*30
    @logs = Log.all
    @log = Log.last
    erb :_new_log, :layout => false
  else
    redirect '/'
  end
end
