IEX::Api.configure do |config|
      config.publishable_token = 'pk_afa79b4656f84dfe80f6f7a49a861750' 
      config.secret_token = 'sk_ddcc441950a64484960328129d4aeb90' 
      config.endpoint = 'https://cloud.iexapis.com/v1' 
end

# client = IEX::Api::Client.new(
#   publishable_token: 'pk_afa79b4656f84dfe80f6f7a49a861750',
#   secret_token: 'sk_ddcc441950a64484960328129d4aeb90',
#   endpoint: 'https://cloud.iexapis.com/v1'
# )