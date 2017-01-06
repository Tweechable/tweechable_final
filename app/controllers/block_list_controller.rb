class BlockListController < ApplicationController
	before_action :is_admin?

	def index
		@list = BlockList.all
	end

	def new

	end

	def create

	end

	def update
		BlockList.find(params[:id]).update(blocklist_params)
		redirect_to block_list_index_path
	end

	private
		def blocklist_params
			params.require(:post).permit(:can_send, :can_receive, :user_name)
		end
end
