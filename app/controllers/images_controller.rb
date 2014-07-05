class ImagesController < ApplicationController

	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			redirect_to root_path
		else
			flash[:error] = "Must be a valid image format"
			render :new
		end
	end

	private
	def image_params
		params.require(:image).permit(:description, :attachment)
	end
	
end