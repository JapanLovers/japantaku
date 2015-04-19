class StaticController < ApplicationController

  def home
  	@title = 'Accueil'
  	@css_current = 'home'
  end

end