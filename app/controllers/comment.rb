get "/comments" do
  @comment = Comment.all
  erb :'comments/new'
end

post '/comments' do
  puts params
  @new_comment = Comment.new(comment_text: params[:comment_text],
                            commentable_type: params[:commentable_type],
                            commentable_id: params[:commentable_id],
                            user_id: current_user.id
                            )
  puts "******************"
  puts @new_comment

  if @new_comment.save
    puts "******************"
    puts "comment saved"
      redirect "/questions"
    else
      puts "******************"
      puts "comment not saved"
      erb :"comments/new"
    end
end
