class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
    before_action :current_user_login, only: [:new, :edit, :show]
    def index
        @blogs = Blog.all
    end
    
    def new
        if params[:back]
        @blog = Blog.new(blog_params)
        else
        @blog = Blog.new
        end
    end
    
    def create
        @blog = Blog.new(params.require(:blog).permit(:title, :content))
        if @blog.save
        redirect_to new_blog_path
        else
        render 'new'
        end
    end
    
    def show
        @blog = Blog.find(params[:id])
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blog_path, notice: "ブログを編集しました。"
        else
            render 'edit'
        end
    end
    
    def destroy
        @blog.destroy
        redirect_to blogs_path, notice:"削除完了"
    end
    
    def confirm
        @blog = Blog.new(blog_params)
        render :new if @blog.invalid?
    end
    
    private
    
    def blog_params
        params.require(:blog).permit(:title, :content)
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end
    
    def current_user_login
        unless  current_user
        # flash[:referer] = 'ログインしてください'
        render new_session_path
        end
    end       
    
    
end
