class BlockList < ActiveRecord::Base

	after_save :check_block

	def self.can_receive(user_id)
		!BlockList.where(user_id: user_id, can_receive: false).any?
	end

	def self.can_send(user_id)
		!BlockList.where(user_id: user_id, can_send: false).any?
	end

	def self.add_user(user_name, can_send, can_receive)
		twitter = Twitter_API.new
    	client = twitter.client
    	user = client.user_search(user_name).first
    	BlockList.create(user_name: user_name, 
    		user_id: user.id, 
    		can_send: can_send, 
    		can_receive: can_receive)
	end

	def check_block
		if can_send && can_receive
			destroy
		end
	end
end
