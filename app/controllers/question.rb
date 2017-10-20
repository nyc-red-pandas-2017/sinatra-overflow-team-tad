get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions' do
  @question = Question.new(params[:question])
  # if request.xhr?
    # erb :'questions/new', layout: false
  # else
    if @question.save
      redirect '/questions'
    else
      puts "didn't save"
      erb :"questions/new"
    end
  # end
end

get '/questions/:id' do
  "hello world"
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
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

delete '/questions/:id' do
  @question = Question.find(params[:id]) #define question to delete
  @question.destroy #delete question
  redirect '/questions' #redirect back to questions index page

end
