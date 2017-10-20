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

