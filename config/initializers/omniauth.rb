Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

	get '/auth/:provider/callback', to: 'sessions#create'
end