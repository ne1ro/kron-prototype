class RegistrationsController < Devise::RegistrationsController
  def create
    user = build_resource(sign_up_params)
    if user.save
      if user.active_for_authentication?
        sign_up('user', user)
        respond_to do |format|
          format.html do
            redirect_to user_path(user)
          end 
          format.json {render :json=> user.as_json(:auth_token=>user.authentication_token, :nickname=>user.nickname), :status=>201}
        end
      end
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

end
