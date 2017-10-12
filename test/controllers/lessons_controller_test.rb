require 'minitest/autorun'
require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
include Devise::Test::ControllerHelpers

  def setup
    @approved_lesson = lessons(:test_lesson)
    @second_approved_lesson = lessons(:test_lesson_two)
    @approved_lessons = Array.new
    @approved_lessons.push(@approved_lesson, @second_approved_lesson)
    @unapproved_lesson = lessons(:test_unapproved)
  end

  test "the search feature only returns lessons that are approved" do
      get :index, keyword: "test"
      assert_response :success
      assert_no_match(@unapproved_lesson.hash_tag, @response.body)
      assert_match(@approved_lesson.hash_tag, @response.body)
  end

    test "the index only returns lessons that are approved" do
      get :index
      assert_response :success
      assert_no_match(@unapproved_lesson.hash_tag, @response.body)
      assert_match(@approved_lesson.hash_tag, @response.body)
  end

end