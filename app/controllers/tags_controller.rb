class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy]
	def show
		@tag = Tag.find(params[:id])
	end
	def index
		@tags = Tag.all
	end
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		flash.notice = "'#{@tag.name}' will never be seen again!"
		redirect_to tags_path
	end
	def edit
		@tag = Tag.find(params[:id])
	end
	def update
		@tag = Tag.find(params[:id])
		@tag.update(name: params[:tag][:name])

		flash.notice = "#{@tag.name}' has been changed"
		redirect_to tags_path
	end
end
