require 'minitest/autorun'
require 'test_helper'
# require 'date'

class TweetsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @lesson = lessons(:test_lesson)
    @tweet = tweet(:test_first_tweet)
    #Controller tests bypass the router, which is where Devise sees what mappings to use before a request. The below lines tell Devise what mappings to use for a request from an admin or a non-admin user.
    @request.env["devise.mapping"] = Devise.mappings[:admin]
  end

  test "get index" do
    get :index, id: @lesson.id
    assert_response :success
  end

  test "users signed in as admins can access the page to edit tweets" do
    sign_in users(:admin)
    get :edit, id: @tweet.id
    assert_response :success
  end

  test "users who are not signed in as admins are redirected when they attempt to edit a lesson" do
    sign_in users(:user)
    get :edit, id: @tweet.id
    assert_response :redirect
  end

  test "users signed in as admins can update tweets" do
    @original_contribution_count = Contribution.all.length
    sign_in users(:admin)
    put :update, id: @tweet.id, tweet: {text: "new content", source: "article"}
    assert_response :redirect
    assert_redirected_to tweets_url(id: @tweet.lesson_id)
    assert_operator(Contribution.all.length, :>, @original_contribution_count)
  end

  test "users not signed in as admins cannot update tweets" do
    @original_contribution_count = Contribution.all.length
    sign_in users(:user)
    put :update, id: @tweet.id, tweet: {text: "new content", source: "article"}
    assert_response :redirect
    assert_redirected_to lessons_url
    assert_operator(Contribution.all.length, :==, @original_contribution_count)
  end

end
