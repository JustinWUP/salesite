module ProductsHelper

	def get_image(sku)
		image = "http://IMAGESERVICE.MODERNRETAIL.COM/arteffect/images/#{sku}.jpg"
		image_tag(image)
	end

end
