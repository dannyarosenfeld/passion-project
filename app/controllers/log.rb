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
