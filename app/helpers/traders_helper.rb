module TradersHelper

  def units_owned(properties)
    sum = 0
    properties.each do |property|
      sum += property.quantity
    end
    sum
  end

end
