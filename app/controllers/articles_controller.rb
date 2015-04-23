class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if check_rights? 'admin'
      @title = 'Liste des articles'
      @articles = Article.all
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @title = Article.find(params[:id]).title
  end

  # GET /articles/new
  def new
    if check_rights? 'user'
      @title = 'Ajout d\'un article'
      @article = Article.new
    end
  end

  # GET /articles/1/edit
  def edit
    @title = 'Modification d\'un article' if check_rights? 'admin_or_owner', Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    if check_rights? 'user'
      article_params_tmp = article_params.merge({:user_id => current_user.id})
      @article = Article.new(article_params_tmp)

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if check_rights? 'admin_or_owner', Article.find(params[:id])
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if check_rights? 'admin_or_owner', Article.find(params[:id])
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :user_id)
    end
end
