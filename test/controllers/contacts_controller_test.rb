require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    #Controller tests bypass the router, which is where Devise sees what mappings to use before a request. The below lines tell Devise what mappings to use for a request from an admin or a non-admin user.
    @contact = contacts(:test_first_contact)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
  end

  test "get new" do
    get :new
    assert_response :success
  end

  test "post successfully submits the contact form" do
    put :update, contact: @contact
    assert_response :redirect
    # assert_redirected_to tweets_url(id: @tweet.lesson_id)
  end


end
