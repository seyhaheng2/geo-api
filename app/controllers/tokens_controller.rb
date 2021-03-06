class TokensController < ApplicationController
  before_action :require_admin
  before_action :get_token, only: [:edit, :update, :destroy]

  # GET /tokens

  def index
    @tokens = ApiKey.all
  end

  # POST /tokens

  def create
    @token = ApiKey.new(token_params)
    if @token.save
      flash[:success] = "Le jeton a bien été créé: #{@token.access_token}."
      redirect_to tokens_path
    else
      render 'new'
    end
  end

  # PUT PATCH /token/:id

  def update
    if @token.update(token_params)
      flash[:success] = "Le jeton a bien été modifié."
      redirect_to tokens_path
    else
      render 'edit'
    end
  end

  # DELETE /token/:id

  def destroy
    key_name = @token.name
    @token.destroy
    flash[:danger] = "Le jeton #{key_name} a bien été revoqué."
    redirect_to tokens_path
  end

  # GET /tokens/new

  def new
    @token = ApiKey.new
  end

  # GET /token/:id/edit

  def edit

  end

  private
    def token_params
      params.require(:api_key).permit(:name)
    end

    def get_token
      @token = ApiKey.find(params[:id])
    end

end
