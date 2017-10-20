get '/questions' do
  @questions = Question.all
  @users = User.all
  erb :'questions/index'
end

post '/questions' do

  @users = User.all
  @current_user = @users.find_by(id: session[:user_id])
  @question = Question.new(question_text: params[:question][:question_text], user_id: session[:user_id])
  if request.xhr? && @question.save
    erb :'questions/_new', layout: false
  else
    p "Not xhr"
  end
end

get '/questions/:id' do
  "hello world"
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @user = User.find_by(id: session[:user_id])

  @question = Question.find_by(id: params[:id], user_id: @user.id)
  if @question
    erb :'questions/edit'
  else
    "Not Today, Phil!"
  end
end

put '/questions/:id' do
   @question = Question.find(params[:id])
   @question.assign_attributes(params[:question])
   if @question.save
    redirect '/questions'
  else
    erb :'questions/edit'
  end
end

post '/questions/:id/vote' do
  questions = Question.find(params[:id])
  questions.votes.create(up_down_vote: 1)
  redirect "/questions"

end

delete '/questions/:id' do
@user = User.find_by(id: session[:user_id])
@question = Question.find_by(id: params[:id], user_id: @user.id)
  if @question
  @question.destroy
  redirect '/questions'
  else
    "Not Today, Pan!"
  end


end
