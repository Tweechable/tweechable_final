class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "ChiHacker", password: "password")
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:name]
  end
end
