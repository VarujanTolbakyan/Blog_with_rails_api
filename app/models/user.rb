class User < ApplicationRecord
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email, case_sensitive: false,
    format: { with:  URI::MailTo::EMAIL_REGEXP  }
  validates_format_of :password,
    with: PASSWORD_REQUIREMENTS , if: :password_changed?

  before_save { self.email = email.downcase if email_changed? }
  before_create { assign_password password }

  def password_is?(plain_pass)
    self.password == encode(plain_pass)
  end

  private

  def assign_password(plain_pass)
    self.salt = Digest::MD5.hexdigest Time.current.to_s
    self.password = encode(plain_pass)
  end

  # encrypt string password with salt
  def encode(plain_pass)
    md5 salt + plain_pass + salt
  end

  def md5(string)
    Digest::MD5.hexdigest string
  end
end
