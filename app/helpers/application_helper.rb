module ApplicationHelper
  def current_user
    # ||= is a example of memoization - the db call is only made once per request
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
