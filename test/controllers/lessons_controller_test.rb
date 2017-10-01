require 'minitest/autorun'
require 'test_helper'

class TweetsControllerTest < ActionController::TestCase

  def setup
    @approved_lesson = lessons(:test_lesson)
    @second_approved_lesson = lessons(:test_lesson_two)
    @approved_lessons = Array.new
    @approved_lessons.push(@approved_lesson, @second_approved_lesson)
    @unapproved_lesson = lessons(:test_unapproved)
  end

  test "the search feature only returns lessons that are approved" do
      get :index, keyword: "test"
      assert_equal @approved_lessons, @response.body
      assert_response :success
  end

  test "the search feature redirects you when you search for lessons that don't exist" do
    get :index, keyword: "nonexistent"
    assert_response :redirect
  end

end