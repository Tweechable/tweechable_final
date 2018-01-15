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

  # test "POST create" do
  #   assert_difference 'ActionMailer::Base.deliveries.size', 1 do
  #     post create_contact_path, params: {
  #       contact: {
  #         name: 'individual',
  #         email: 'individual@gmail.com',
  #         message: 'hello there'
  #       }
  #     }
  #   end

  #   assert_redirected_to new_contact_path

  #   follow_redirect!

  #   assert_match /Message received, thanks!/, response.body
  # end


end
