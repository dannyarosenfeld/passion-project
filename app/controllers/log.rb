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
  end

  if request.xhr?
    id = params[:id].to_i
    @log = Log.find(id)
    fcount = @log.user.followers.count
    unfollow_but = erb :_unfollowbutton, :layout => false
    content_type :json
    {log_id: id, unfollow: unfollow_but, fcount: fcount}.to_json
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
if request.xhr?
    id = params[:id].to_i
    @log = Log.find(id)
    fcount = @log.user.followers.count
    follow_but = erb :followbut, :layout => false
    content_type :json
    {log_id: id, follow: follow_but, fcount: fcount}.to_json
  else
    redirect "/"
end

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
