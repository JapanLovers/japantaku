class SessionsController < ApplicationController
  def new
  	@titre = 'Authentification'
  end

  def create
  	user = User.authenticate(params[:session][:pseudo_or_email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Combinaison Pseudo/Mot de passe invalide."
      @titre = "S'identifier"
      render 'new'
    else
      flash.now[:success] = "Bienvenue sur JapanTaku !"
      sign_in user
      redirect_to current_user
    end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
