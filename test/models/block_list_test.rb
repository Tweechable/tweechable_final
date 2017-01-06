require 'test_helper'

class BlockListTest < ActiveSupport::TestCase
  setup do
  	@no_send = block_list(:NoSend)
  	@no_receive = block_list(:NoReceive)
  end

  test "Test can_send function" do
  	assert_not( BlockList.can_send(@no_send.user_id), "Users marked as can't send should return false")
  	assert( BlockList.can_send(@no_receive.user_id), "Users marked as can send should return true")
  	assert( BlockList.can_send(0), "Users not on the list should return true")
  end

  test "Test can_receive function" do
  	assert_not(BlockList.can_receive_id(@no_receive.user_id), "Users marked as can't received should return false")
  	assert(BlockList.can_receive_id(@no_send.user_id), "Users marked as can receive should return true")
  	assert(BlockList.can_receive_id(0), "Users not on the list should return true")
  end
end
