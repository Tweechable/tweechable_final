class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
  end

  test '#contributions' do
    assert_equal 2, @user.contributions.size
  end

  test '#lessons' do
    assert_equal 2, @user.contributions.size
  end
end
