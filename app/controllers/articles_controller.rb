class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]
  
  #投稿一覧-----------------------------------
  def index
    @articles = Article.all
  end
  
  #投稿画面-----------------------------------
  def new
    if params[:back]
      @article = Article.new(article_params)
    else
      @article = Article.new
    end
  end
  
  #投稿---------------------------------------
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice:"一言投降完了！"
    else
      render 'new'
    end

  end
  
  
  #投稿編集-----------------------------------
  def edit

  end
  
  
  #投稿更新-----------------------------------
  def update

    if @article.update(article_params)
      redirect_to articles_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
    
  end
  
  
  #削除機能------------------------------------
  
  def destroy
    @article.destroy
    redirect_to articles_path, notice:"一言を削除しました"
  end
  
  #投稿確認------------------------------------
  def confirm
    @article = Article.new(article_params)
    render :new if @article.invalid?
  end
  
  
  
#---------------------------------------------
  private
  def article_params
    params.require(:article).permit(:content)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  
end
