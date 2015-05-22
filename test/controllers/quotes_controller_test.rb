require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
  	quote = Quote.create(:author => 'Sunny Wong', :saying => 'Hi there.')
     assert true
     get :show, :id => quote.id
     assert_response :success 
  end

  test "quote show page, not found" do 
  	get :show, :id => 'OMG'
  	assert_response :not_found

  end



end






# get :show, :id => quote.id //// trigger the show page within the test 
# asset_response :success //// make sure the page doesn't come back with non sucessful HTTP status code
#