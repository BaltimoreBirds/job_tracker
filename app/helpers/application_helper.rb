module ApplicationHelper

  def current_user?
    user = User.where(github_uid: session[:uid]).first
    return user
  end
end
