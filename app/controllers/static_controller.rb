class StaticController < ApplicationController

  def home
  	@title = 'Accueil'
  	@css_current = 'home'
  end

  def about
  	@title = 'À Propos'
  	@general_desc = "Ce site a été réalisé pour " + \
  					"mettre en commun nos expériences sur le " + \
  					"Japon";
  	@users = User.all
  end

  def contact
  	@title = "Contact"
  	@users = User.all
  end

  def not_found
    @title = 'Page non trouvée'
  end

end