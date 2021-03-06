module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def sign_out
  	cookies.delete(:remember_token)
  	self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def is_admin? 
    !current_user.nil? && current_user.is_admin
  end

  def check_rights?(req, obj=nil)
  	if current_user.nil?
  	  redirect_to not_found_path
      return false
  	end

  	if req == 'admin_or_owner'
  	  if !current_user.is_admin
  	  	if !is_owner?(obj)
  	  	  redirect_to not_found_path
          return false 
  	  	end
  	  end
   	elsif req == 'admin'
  	  if !current_user.is_admin
  	  	redirect_to not_found_path
        return false
  	  end
  	elsif req == 'user'
  	  if current_user.nil?
  	  	redirect_to not_found_path
        return false
  	  end
  	end

    true
  end

  def is_owner?(obj)
    return false if obj.nil? || current_user.nil?

  	if obj.class == User
  	  # to edit an user profile
  	  current_user.id == obj.id
  	elsif obj.class == Article
  	  # to edit an article
  	  current_user.id == obj.user_id
  	elsif obj.class == Comment
      # to edit a comment
      art = Article.find(obj.article_id)
      current_user.id == art.user_id || obj.user_id == current_user.id
  	end
  end	

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

end
