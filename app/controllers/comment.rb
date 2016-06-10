post '/comments' do
  @current_user = User.find(session[:user_id]) if session[:user_id]
  @log = Log.find(params[:logid])
  comment = Comment.create(content: params[:content], user_id: @current_user.id, log_id: params[:logid] )


  if request.xhr?
    p "blah"*30
    @comments = Comment.all
    @comment = Comment.last
    erb :_new_comment, :layout => false
  else
    redirect "/logs/#{@comment.log_id}"
  end
end
