#ActiveRecord framework is 2000 lines of code ...etc; helps you avoid having to write SQL code; does all the hard work of communicating with DB.
# Quote is inheriting from ActiveRecord
class Quote < ActiveRecord::Base
	validates :saying, :presence => true, :length => {:maximum => 140, :minimum => 3}
	validates :author, :presence => true, :length => {:maximum => 50, :minimum => 3}

	def unique_tag
		abbr = self.author.split(" ").collect do |sub_string|
			sub_string[0]
		end

		abbr.join + '#' + self.id.to_s
	end

end
