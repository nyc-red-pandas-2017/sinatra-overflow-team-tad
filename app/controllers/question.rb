get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions' do
  @question = Question.new(question_text: params[:question][:question_text], user_id: session[:user_id])
  if request.xhr? && @question.save
    erb :'questions/_new', layout: false
  else
    p "Not xhr"
  end
end

