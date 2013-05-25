class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         :omniauthable, :omniauth_providers => [:facebook, :google, :twitter, :vkontakte, :github]
  ## Database authenticatable
  field :nickname,           :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time
  field :remember_me, type: Boolean

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  field :authentication_token, :type => String
  
  field :fullname, :type => String, :default => ""
  field :birthday, :type => DateTime
  field :about, :type => String
  field :email, :type => String, :default => ""
  field :avatar, :type => String
  field :bg, :type => String
  field :profile_bg, :type => String

  # Embeds
  embeds_many :events

  # Here is validations
  validates :nickname, format: {with: /\A[a-zA-Z0-9]+\z/}, length: { minimum: 3, maximum: 50}, presence: true, uniqueness: true
  validates :fullname, length: { maximum: 255}
  validates :email, uniqueness: true, on: :update

  # Accessible
  attr_accessible :nickname, :email, :password, :fullname, :about, :birthday, :avatar, :bg, :profile_bg, :remember_me

  # Email is not required
  def email_required?
    false
  end

  # Callbacks
  before_save :reset_authentication_token

end
