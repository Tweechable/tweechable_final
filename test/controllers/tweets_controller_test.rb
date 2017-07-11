require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @lesson = lessons(:test_lesson)
  end

  test "get index" do
    get :index, id: @lesson.id
    assert_response :success
  end
end
