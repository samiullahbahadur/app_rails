class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  before_action :require_user_logged_in ,  except: [:index, :show]
  before_action :require_same_user, only:[:edit, :update, :destroy]
  def index

    @articles=Article.all.page(params[:page])
  end

  def new
    @article=Article.new
  end
  def edit
   
  end
  def update
  
    if @article.update(article_params)
      redirect_to articles_path, notice:"Updated succcessfully!"
    else
      render 'edit'
    end
  end 
  def create
    #render plain: params[:article].inspect
    @article=Article.new(article_params)
    @article.user=@current_user
     if @article.save
      redirect_to articles_path, notice:"Created succcessfully!"
      else
       render :new
     end
  end

  def show 
   
  end
     
  def destroy
 
  @article.destroy
  #flash[:notice] = "Article was successfully deleted"
  redirect_to articles_path
  end
  private
  def set_article
    @article = Article.find(params[:id])
  end

    def article_params
       params.require(:article).permit(:title, :description)
    end
   def require_same_user 
    if @current_user !=@article.user && !@current_user.admin?
      flash[:danger]="You can only edit or delete your own articles"
      redirect_to root_path
    end 
  end


end
