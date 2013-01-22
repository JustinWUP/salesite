module ApplicationHelper
	def format_price(price)
		if price != nil 
			result = "$" + price
			return result
		end
	end
end
