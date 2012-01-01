class Heroes::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    puts "--------> #{request.env["omniauth.auth"]}"
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  protected
  def after_sign_in_path_for(resource)
    root_path
  end

end