IEX::Api.configure do |config| 
	config.publishable_token = Rails.application.credentials.iex[:publishable_token]
	config.secret_token = Rails.application.credentials.iex[:secret_token]
	config.endpoint = Rails.application.credentials.iex[:endpoint]
end
