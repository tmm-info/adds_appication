class User < ApplicationRecord
  include PgSearch::Model
  scope :sorted, ->{ order(username: :asc) }

  pg_search_scope :search_by_user,
                  against: [
                    :username,
                    :email
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      negation: true,
                      highlight: {
                        start_sel: '<b>',
                        stop_sel: '</b>',
                      }
                    }
                  }
  has_many :adds, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable
  belongs_to :role, optional: true
  has_many :adds, dependent: :destroy
  # validates :username, presence: true
  before_save :assign_role

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end

  def assign_role
    self.role = Role.find_by name: 'Registered' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def registered?
    role.name == 'Registered'
  end

  def regular?
    role.name == 'Regular'
  end
end
