module ApplicationHelper

  def current_user?
    user = User.where(github_uid: session[:uid]).first
    return user
  end

 #  def include_gon
	#   data = Rails.cache.read('gon_variables') || {}

	#   script = "<script>window.gon = {};"
	#   data.each do |key, val|
	#     script += "gon." + key.to_s + val.to_json + ";"
	#   end
	#   script += "</script>"
	#   script.html_safe
	# end
end
