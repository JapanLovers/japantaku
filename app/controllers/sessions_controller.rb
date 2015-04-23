class SessionsController < ApplicationController
  def new
  	@title = 'Authentification'
  end

  def create
  	user = User.authenticate(params[:session][:pseudo_or_email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Combinaison Pseudo/Mot de passe invalide."
      @titre = "S'identifier"
      render 'new'
    else
      sign_in user
      redirect_to current_user
      flash.now[:error] = "Bienvenue sur JapanTaku !"
    end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

end
