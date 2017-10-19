get '/users/new' do
  @user = User.new
  erb :"users/new"
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  redirect '/' unless @user.id = session[:user_id]
  erb :'sessions/login'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @error = @user.errors.full_messages
    erb :'users/new'
  end
end
