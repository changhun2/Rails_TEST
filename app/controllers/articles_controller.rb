class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @article = Article.all
  end

  def show
    @article = Article.find_by_id(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
  end
  
  def create
   @article = Article.new(article_params)
   
   @user = User.find_by_name(session[:current_user_id])
   puts(@user.id)
   puts(@article.title)
   puts(@article.text)
   puts(@article)
   puts(@article.user_id)
   @article.user_id = @user.id
   
   if @article.save
     redirect_to @article
   else
     render 'new'
   end
  end
  
  def update
    @article = Article.find_by_id(params[:id])
    
    if @article .update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
