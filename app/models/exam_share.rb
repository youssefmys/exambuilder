class ExamShare < ApplicationRecord

  #validations
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, :format => {:with => EMAIL_REGEX }, :if => Proc.new {|e| e.email.present?}

  #associations
  belongs_to :exam

  def authenticate_share_token(token)
    if BCrypt::Password.new(self.share_digest).is_password?(token)
      if self.one_time_use
        self.update_attribute(:share_digest, nil)
      end
      return true
    else
      return false
    end
  end

  def create_share_digest
    token = self.create_token
    digest = BCrypt::Password.create(token)
    self.update_attribute(:share_digest, digest)
    return token
  end


  def create_token
    SecureRandom.urlsafe_base64
  end

end
