class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:name]
  end

  test '#contributions' do
    assert_equal 2, @user.contributions.size
  end

  test '#lessons' do
    assert_equal 2, @user.contributions.size
  end
end
