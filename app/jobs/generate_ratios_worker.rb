class GenerateRatiosWorker

	@queue = :generate_ratios

	def self.perform
		puts "hello this is worker"

		Currency.where.not(default: true).each do |c|
			new_ratio = Ratio.create(currency_id: c.id, ratio: rand(10))
		end
	rescue => e
		puts e.message
	end

end