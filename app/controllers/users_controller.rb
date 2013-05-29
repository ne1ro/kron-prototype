class UsersController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  before_filter :check_auth, only: [:show, :index]
  before_filter :ensure_params_exist, except: [:show, :destroy, :index]  

  def create
    build_resource
    resource = User.find_for_database_authentication(nickname: params[:user][:nickname])
    resource[:remember_me] = params[:user][:remember_me]
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      sign_in("user", resource)
      resource.remember_me!
      respond_to do |format|
        format.html {respond_with resource, location: user_path(resource)}
        format.json {render :json=> {:success=>true, :auth_token => resource.authentication_token, :nickname=>resource.nickname}}
      end
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    sign_out(resource_name)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render :json => { :message => ["Session deleted."] },  :success => true, :status => :ok}
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html do
        if @user.fullname.blank?
          @title = @user.nickname
        else
          @title = @user.fullname
        end
      end
      format.json {render json: @user}
    end
  end
  
  def index
    @users = User.all.shuffle[0...32]
    respond_to do |format|
      format.html {@title = 'Kron users'}
      format.json {render json: @users} 
    end
  end

  protected
  # Check authorization for users
  def check_auth
    unless user_signed_in?
      redirect_to '/welcome'
    end
  end
  
  def ensure_params_exist
    return unless params[:user][:nickname].blank?
    render :json=>{:parameters => params[:user], :success=>false, :message=>"missing login parameter"}, :status=>422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

end
