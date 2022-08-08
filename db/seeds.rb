# Initialize Admin Account
admin_account = {
  first_name: "Eluder",
  last_name: "Admin",
  email: "admin@eluder.com",
  password: "eluder2022",
  role: "admin"
}
User.create(admin_account)

# Drop Existing Stock Objects
# Stock.destroy_all
# Seed Stock Model
client = IEX::Api::Client.new
top10 = client.stock_market_list(:mostactive)

top10.each do |stock|
  company = client.company(stock.symbol)
  logo = client.logo(stock.symbol)
  stock_params = {
    symbol: stock.symbol,
    name: stock.company_name,
    latest_price: stock.latest_price,
    exchange: company.exchange,
    sector: company.sector,
    industry: company.industry,
    description: company.description,
    logo: logo.url
  }
  Stock.create(stock_params)
end
