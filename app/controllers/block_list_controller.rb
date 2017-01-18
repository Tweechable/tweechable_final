class BlockListController < ApplicationController
	before_action :is_admin?

	def index
		@list = BlockList.all
	end

	def new
		@list = BlockList.new
	end

	def create
		begin
			BlockList.add_user(
				params["block_list"]["user_name"],
				params["block_list"]["can_send"],
				params["block_list"]["can_receive"])
		rescue StandardError => e
			flash[:alert] = "Create Failed: #{e.message}"
			# redirect_to new_block_list_path
		# ensure
		# 	flash[:alert] = "Create Failed: Unknown error"
		# 	# redirect_to new_block_list_path
		end
		redirect_to block_list_index_path
	end

	def update
		new_block = BlockList.find(params[:id]).update(blocklist_params)
		if new_block.nil?
			flash[:alert] = "Error "
		end
		redirect_to block_list_index_path
	end

	private
		def blocklist_params
			params.require(:post).permit(:can_send, :can_receive, :user_name)
		end
end
