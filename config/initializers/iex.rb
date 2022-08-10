IEX::Api.configure do |config| 
	# For Production
	# config.publishable_token = Rails.application.credentials.iex.production[:publishable_token]
	# config.secret_token = Rails.application.credentials.iex.production[:secret_token]
	# config.endpoint = Rails.application.credentials.iex.production[:endpoint]
	# For Sandbox
	config.publishable_token = Rails.application.credentials.iex.sandbox[:publishable_token]
	config.secret_token = Rails.application.credentials.iex.sandbox[:secret_token]
	config.endpoint = Rails.application.credentials.iex.sandbox[:endpoint]
end

