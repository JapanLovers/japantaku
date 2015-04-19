class SessionsController < ApplicationController
  def new
  	@titre = 'Authentification'
  end

  def create
  	user = User.authenticate(params[:session][:pseudo], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Combinaison Pseudo/Mot de passe invalide."
      @titre = "S'identifier"
      render 'new'
    else
      sign_in user
      render 'static/home'
    end
  end

  def destroy
  end
end
