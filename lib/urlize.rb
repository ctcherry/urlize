module Urlize

	def urlize
		self.gsub(/[^[:alnum:]\-\s\_]/, '').split(/[\s\-\_]+/).delete_if{|i| i.empty?}.join('-').downcase
	end
	
end