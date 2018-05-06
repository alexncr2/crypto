class Currency < ApplicationRecord
	has_many :ratios

	#from_currency is default nil
	def price(from_currency = nil)
		from_ratio = from_currency.nil? ? Currency.default_ratio : from_currency.ratios.last.ratio
		(from_ratio / current_ratio).round(5)
	end

	def current_ratio
		puts self.to_yaml
		self.ratios.last.ratio
	end


	#static method
	def self.default_ratio
		Currency.find_by(name: 'USD').ratios.last.ratio
	end
end
