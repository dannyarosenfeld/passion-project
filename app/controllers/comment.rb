post '/comments' do
  @current_user = User.find(session[:user_id]) if session[:user_id]
  @log = Log.find(params[:logid])
  comment = Comment.create(content: params[:content], user_id: @current_user.id, log_id: params[:logid] )
  redirect "/logs/#{@log.id}"
end
