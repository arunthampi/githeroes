class Heroes::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @hero = Hero.find_for_github_oauth(request.env["omniauth.auth"], current_hero)

    if @hero.persisted?
      cookies['_githeroes_name'] = @hero.name
      cookies['_githeroes_img'] = @hero.avatar_url

      sign_in_and_redirect @hero, :event => :authentication
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  protected
  def after_sign_in_path_for(resource)
    root_path
  end

end