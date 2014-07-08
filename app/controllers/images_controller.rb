class ImagesController < ApplicationController

	skip_before_filter :verify_authenticity_token, :only => [:create] # Needed this shit or else it kept giving "Can't verify CSRF token authenticity" error. Not sure if this adds some kind of vulnerability to the app. Without it, it kept returning current_user as nil. wtf is CSRF? need to look this up.

	def new
		@image = Image.new
	end

	def create
		@image = current_user.images.new(image_params)
		if current_user && @image.save
			respond_to do |format|
				format.html {redirect_to root_path}
				# format.js
				# apparently, ajax request cannot be done for uploads.
			end
		else
			# flash[:error] = "Must be a valid image format"
			render :new
		end
	end

	def mypics
		@images = current_user.images
	end

	def newimages

	end

	def rankedimages
		@images = Image.all
	end

	def upvote
		@image = Image.find(params[:id])
		@vote = Vote.where(user_id: current_user.id, image_id: @image.id)
		if @vote.length > 0
			flash.alert = "You can only vote once per image."
		else
			@vote = Vote.create(user_id: current_user.id, image_id: @image.id, voted: true)
			@image.votecount +=1
			@image.save
		end
	end

	def downvote
		@image = Image.find(params[:id])
		@vote = Vote.where(user_id: current_user.id, image_id: @image.id)
		p @vote
		if @vote.length > 0
			flash.alert = "You can only vote once per image."
		else
			@vote = Vote.create(user_id: current_user.id, image_id: @image.id, voted: true)
			@image.votecount -=1
			@image.save
		end
	end

	private
	def image_params
		params.require(:image).permit(:user_id, :description, :attachment)
	end
	
end