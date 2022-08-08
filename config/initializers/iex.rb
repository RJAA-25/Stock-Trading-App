# IEX::Api.configure do |config| 
# 	config.publishable_token = Rails.application.credentials.iex[:publishable_token]
# 	config.secret_token = Rails.application.credentials.iex[:secret_token]
# 	config.endpoint = Rails.application.credentials.iex[:endpoint]
# end

IEX::Api.configure do |config| 
	config.publishable_token = 'Tpk_b7c58d3f79ea42fea289358e8b301786'
	config.secret_token = 'Tsk_c8eab45501454388a64d510877fd82c8'
	config.endpoint = 'https://sandbox.iexapis.com/v1'
end

