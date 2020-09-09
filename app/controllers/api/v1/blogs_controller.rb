module Api
	module V1
		class BlogsController < ApplicationController
			before_action :set_blog, only: [:show, :update, :destroy]
			before_action :current_user, only: [:create,:destroy,:update]

			def index
			  blogs = Blog.order(created_at: :desc)
			  render json: { status: 'SUCCESS', message: 'Loaded blogs', data: blogs }
			end

			def show
			  render json: { status: 'SUCCESS', message: 'Loaded the blog', data: @blog }
			end

			def create
			  blog = Blog.new(blog_params)
			  blog.uid = @current_user.id
				if blog.save
					render json: { status: 'SUCCESS', data: blog }
				else
					render json: { status: 'ERROR', data: blog.errors }
				end
			end

			def destroy
			  @blog.destroy
  		  	  render json: { status: 'SUCCESS', message: 'Deleted the blog', data: @blog }
			end

			def update
				# if @blog.uid != @current_user.id
				#     render json: { status: 'SUCCESS', message: 'cannot update blog user'}
				# end
				if @blog.update(blog_params)
					render json: { status: 'SUCCESS', message: 'Updated the blog', data: @blog }
				else
					render json: { status: 'SUCCESS', message: 'Not updated', data: @blog.errors }
				end
			end

			private
			def set_blog
			  @blog = Blog.find(params[:id])
			end

			def blog_params
				params.require(:blog).permit(:title, :detail, :summary)
			end
	  end
	end
end