IEX::Api.configure do |config| 
		config.publishable_token = Rails.application.credentials.iex.sandbox[:publishable_token]
		config.secret_token = Rails.application.credentials.iex.sandbox[:secret_token]
		config.endpoint = Rails.application.credentials.iex.sandbox[:endpoint]
end

