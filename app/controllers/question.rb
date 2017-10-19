get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions' do
  @question = Question.new(params[:question])
  if request.xhr?
    erb :'questions/new', layout: false
  else
    redirect '/questions'
  end
end

