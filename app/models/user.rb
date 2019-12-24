class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :trainers
  has_many :pokemons
  # has_many :trained_pokemons, through: :trainers, class: "Pokemon", foreign_key: "trainer_id"
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid, email: auth.info.email).first_or_create! do |user|
      # user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name  
      user.last_name = auth.info.first_name  
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_oauth2_data"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # validates :first_name, presence: true
  # validates :last_name, presence: true

  scope :administrators, -> { where(admin: true) }
  scope :normies, -> { where(admin: false) }
end
