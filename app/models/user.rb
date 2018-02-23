class User < ApplicationRecord

  before_create :set_default_role

  has_secure_password

  #validation
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, :format => {:with => EMAIL_REGEX }
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
  validates :password, :length => {:minimum => 3, :allow_nil => true }, :confirmation => true
  validates :username, :length => {:minimum => 3, :maximum => 15}


  #associations
  has_many :exams

  enum :role => [:admin, :tutor]

  def self.add_digest_methods
    ["password_reset", "activation"].each do |e|
      define_method "create_#{e}_digest" do
        token = self.class.create_token
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        update_attribute("#{e}_digest".to_sym, BCrypt::Password.create(token, :cost => cost))
        return token
      end
    end
  end

  add_digest_methods

  def authenticate_token(auth_attributes)
    auth_attributes.each do |key, value|
      if BCrypt::Password.new(self.send("#{key}_digest")).is_password?(value)
        update_attribute("#{key}_digest".to_sym, nil)
        return true
      else
        return false
      end
    end
  end


  private

  def self.create_token
    SecureRandom.urlsafe_base64
  end

  def set_default_role
    self.role ||= :tutor
  end

end
