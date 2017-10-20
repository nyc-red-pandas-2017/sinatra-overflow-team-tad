def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def own_question?(question)
  logged_in? && question.user_id == current_user
end
