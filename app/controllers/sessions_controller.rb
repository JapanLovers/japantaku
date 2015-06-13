class SessionsController < ApplicationController

  def new
    if signed_in?
     already_connected
    else
     @title = 'Authentification'     
    end
  end

  def create
  	user = User.authenticate(params[:session][:pseudo_or_email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Combinaison Pseudo/Mot de passe invalide."
      @title = "Authentification"
      render 'new'
    else
      sign_in user
      redirect_to current_user
    end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

  def already_connected
    @title='Erreur'
    @err_mess = 'Vous êtes déjà connecté !'
    render 'session_error'
  end

end
