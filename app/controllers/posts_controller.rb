class PostsController < ApplicationController

  # вызывает приватный метод set_post перед указанными методами :show, :edit, :update, :destroy
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5) #добавляем пагинацию на страницу для статей
  end


  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Post was success created' # направляет с сообщением зелёного цвета (бутстраповские алерты) /posts/
    else
      render :new , danger: 'Post wasn\'t created' # направляет с сообщением красного цвета (бутстраповские алерты)
    end
  end

  def edit

  end

  def edit_comment
     render layout: false
  end

  def update

    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Post was success updated' # направляет с сообщением зелёного цвета (бутстраповские алерты)
    else
      render :edit, danger: 'Post was not updated' # направляет с сообщением красного цвета (бутстраповские алерты)
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Post was success deleted' # направляет с сообщением зелёного цвета (бутстраповские алерты)
  end
  private

# приватный метод, в котором обязательный параметр :posts в котором разрешаем следующие поля :title, :summary, :body
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

