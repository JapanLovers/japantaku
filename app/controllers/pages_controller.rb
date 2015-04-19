class PagesController < ApplicationController

  def home
  	@titre = "Accueil"
  	@css_current = 'home'
  end

end