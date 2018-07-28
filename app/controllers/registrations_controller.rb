class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  
    def create
        User.create!({:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation] })
        redirect_to root_path
    end

    protected
  

  
    def sign_up(resource_name, resource)
    end
  end