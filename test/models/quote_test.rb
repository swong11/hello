require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
 
	test "unique_tag" do 
		quote = Quote.create(:author => 'Walt Disney', :saying => 'If you can dream it, you can do it.')
		
		expected = 'WD#' + quote.id.to_s
		actual = quote.unique_tag
		assert_equal expected, actual
	end

end
