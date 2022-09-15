class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :schedules, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]


  before_save :capitalize_name

  has_one_attached :avatar
  has_one_attached :certificate

  validates :firstname, :lastname, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      user.avatar_url = auth.info.image
      if (auth.info.gender == 'male')
        user.gender = 'M'
      else  
        user.gender = 'F'
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "100x100!").processed 
    else
      "/images/no_avatar.pgn"
    end
  end

  def certificate_thumbnail
    if certificate.attached?
      certificate.variant(resize: "100x100!").processed 
    end
  end


  private
    def capitalize_name
      self.firstname = self.firstname.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
      self.lastname = self.lastname.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
    end

end
