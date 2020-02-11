class BlogsController < ApplicationController
# indexからeditまでがview関連
# @のインスタンス変数はviewに渡す用
  def index
  # 記事を全件取得
  # @blogsはアクションから渡ってきている投稿記事のデータ
  # @blog(s)はHTTPメソッドで使用するリソースの設定をしている
      @blogs = Blog.all
  end

  def show
  	# URLにパラメータが設定されているので、params[:id]と記述することで記事のIDを取得
  	  @blog = Blog.find(params[:id])
  end

  def new
  	# @インスタンス変数 = モデル名(大文字単数).new
  	  @blog = Blog.new
  end

  def edit
  	  @blog = Blog.find(params[:id])
  end

# 以下view関連なし
  def create
  	  # ローカルのインスタンス変数=モデル名.new(アクション名)
  	  blog = Blog.new(blog_params)
  	  blog.save
  	  redirect_to blogs_path # トップページに飛ぶ
  end

  def update # 6
  	  blog = Blog.find(params[:id])
  	  blog.update(blog_params)
  	  redirect_to blogs_path(blog) # トップページに飛ぶ
  end

  def destroy # 7
  	  blog = Blog.find(params[:id])
  	  blog.destroy
  	  redirect_to blogs_path # トップページに飛ぶ
  end

# Strong Parametersの設定
  private
  # blog_paramsというアクション
  def blog_params
  	params.require(:blog).permit(:title, :category, :body)
  end
end
